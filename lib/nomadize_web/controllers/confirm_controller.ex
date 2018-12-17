defmodule NomadizeWeb.ConfirmController do
  use NomadizeWeb, :controller

  import NomadizeWeb.Authorize

  alias Phauxth.Confirm
  alias Nomadize.Accounts
  alias NomadizeWeb.Email

  def index(conn, params) do
    case Confirm.verify(params) do
      {:ok, user} ->
        Accounts.confirm_user(user)
        Email.confirm_success(user.email)

        conn
        |> put_view(NomadizeWeb.ConfirmView)
        |> render("info.json", %{info: "Your account has been confirmed"})

      {:error, _message} ->
        error(conn, :unauthorized, 401)
    end
  end
end
