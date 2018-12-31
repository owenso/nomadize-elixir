defmodule NomadizeWeb.Authorize do
  @moduledoc """
  Functions to help with authorization.

  See the [Authorization wiki page](https://github.com/riverrun/phauxth/wiki/Authorization)
  for more information and examples about authorization.
  """

  import Plug.Conn
  import Phoenix.Controller

  @doc """
  Plug to only allow authenticated users to access the resource.

  See the user controller for an example.
  """
  def user_check(%Plug.Conn{assigns: %{current_user: nil}} = conn, _opts) do
    error(conn, :unauthorized, 401)
  end

  def user_check(conn, _opts), do: conn

  @doc """
  Plug to only allow unauthenticated users to access the resource.

  See the session controller for an example.
  """
  def guest_check(%Plug.Conn{assigns: %{current_user: nil}} = conn, _opts), do: conn

  def guest_check(%Plug.Conn{assigns: %{current_user: _current_user}} = conn, _opts) do
    conn
    |> put_status(:unauthorized)
    |> put_view(NomadizeWeb.AuthView)
    |> render("logged_in.json", [])
    |> halt()
  end

  @doc """
  Plug to only allow authenticated users with the correct id to access the resource.

  See the user controller for an example.
  """
  def id_check(%Plug.Conn{assigns: %{current_user: nil}} = conn, _opts) do
    error(conn, :unauthorized, 401)
  end

  def id_check(
        %Plug.Conn{params: %{"id" => id}, assigns: %{current_user: current_user}} = conn,
        _opts
      ) do
    if id == to_string(current_user.id) do
      conn
    else
      error(conn, :forbidden, 403)
    end
  end

    # role checks
  # http://www.alexafshar.com/2017/10/18/phoenix-auth-guardian-coherence-phauxth-part-two.html
  def role_check(%Plug.Conn{assigns: %{current_user: nil}} = conn, _opts) do
    error(conn, :forbidden, 403)
  end

  def role_check(%Plug.Conn{assigns: %{current_user: current_user}} = conn, opts) do
    if opts[:roles] && current_user.role in opts[:roles],
      do: conn,
      else: error(conn, :unauthorized, 401)
  end

  def id_or_role(%Plug.Conn{assigns: %{current_user: nil}} = conn, _opts),
    do: error(conn, :forbidden, 403)

  def id_or_role(
        %Plug.Conn{params: %{"id" => id}, assigns: %{current_user: current_user}} = conn,
        opts
      ) do
    if (opts[:roles] && current_user.role in opts[:roles]) or id == to_string(current_user.id) do
      conn
    else
      error(conn, :unauthorized, 401)
    end
  end

  def error(conn, status, code) do
    put_status(conn, status)
    |> put_view(NomadizeWeb.AuthView)
    |> render("#{code}.json", [])
    |> halt()
  end
end
