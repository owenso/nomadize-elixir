defmodule Nomadize.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false

  alias Nomadize.{Accounts.User, Repo, Sessions, Sessions.Session}
  @doc """
  Returns the list of users.
  """
  def list_users, do: Repo.all(User)

  @doc """
  Gets a single user.
  """
  def get_user(id), do: Repo.get(User, id)

  @doc """
  Gets a user based on the params.

  This is used by Phauxth to get user information.
  """
  def get_by(%{"session_id" => session_id}) do
    with %Session{user_id: user_id} <- Sessions.get_session(session_id),
         do: get_user(user_id)
  end

  def get_by(%{"email" => email}) do
    Repo.get_by(User, email: email)
  end

  def get_by(%{"user_id" => user_id}), do: Repo.get(User, user_id)

  @doc """
  Creates a user.
  """
  def create_user(attrs) do
    %User{}
    |> User.create_changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.
  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.
  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  @doc """
  Confirms a user's email.
  """
  def confirm_user(%User{} = user) do
    user |> User.confirm_changeset() |> Repo.update()
  end

  @doc """
  Makes a password reset request.
  """
  def create_password_reset(attrs) do
    with %User{} = user <- get_by(attrs) do
      user
      |> User.password_reset_changeset(DateTime.utc_now() |> DateTime.truncate(:second))
      |> Repo.update()
    end
  end

  @doc """
  Updates a user's password.
  """
  def update_password(%User{} = user, attrs) do
    Sessions.delete_user_sessions(user)

    user
    |> User.create_changeset(attrs)
    |> User.password_reset_changeset(nil)
    |> Repo.update()
  end

  alias Nomadize.Accounts.LoginLog

  @doc """
  Returns the list of login_log.

  ## Examples

      iex> list_login_log()
      [%LoginLog{}, ...]

  """
  def list_login_log do
    Repo.all(LoginLog)
  end

  @doc """
  Gets a single login_log.

  Raises `Ecto.NoResultsError` if the Login log does not exist.

  ## Examples

      iex> get_login_log!(123)
      %LoginLog{}

      iex> get_login_log!(456)
      ** (Ecto.NoResultsError)

  """
  def get_login_log!(id), do: Repo.get!(LoginLog, id)

  @doc """
  Creates a login_log.

  ## Examples

      iex> create_login_log(%{field: value})
      {:ok, %LoginLog{}}

      iex> create_login_log(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_login_log(attrs \\ %{}) do
    %LoginLog{}
    |> LoginLog.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a login_log.

  ## Examples

      iex> update_login_log(login_log, %{field: new_value})
      {:ok, %LoginLog{}}

      iex> update_login_log(login_log, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_login_log(%LoginLog{} = login_log, attrs) do
    login_log
    |> LoginLog.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a LoginLog.

  ## Examples

      iex> delete_login_log(login_log)
      {:ok, %LoginLog{}}

      iex> delete_login_log(login_log)
      {:error, %Ecto.Changeset{}}

  """
  def delete_login_log(%LoginLog{} = login_log) do
    Repo.delete(login_log)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking login_log changes.

  ## Examples

      iex> change_login_log(login_log)
      %Ecto.Changeset{source: %LoginLog{}}

  """
  def change_login_log(%LoginLog{} = login_log) do
    LoginLog.changeset(login_log, %{})
  end
end
