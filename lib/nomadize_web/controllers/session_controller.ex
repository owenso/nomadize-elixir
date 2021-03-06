defmodule NomadizeWeb.SessionController do
  require Logger

  use NomadizeWeb, :controller
  import NomadizeWeb.Authorize

  alias Nomadize.Sessions
  alias Nomadize.Accounts
  alias NomadizeWeb.Auth.Login
  alias NomadizeWeb.Auth.Token

  # the following plug is defined in the controllers/authorize.ex file
  plug(:guest_check when action in [:create])

  def create(conn, %{"session" => params}) do
    case Login.verify(params) do
      {:ok, user} ->
        Logger.info("Var value: #{inspect(user)}")

        Accounts.create_login_log(%{
          user_id: user.id,
          ip_address: to_string(:inet_parse.ntoa(conn.remote_ip))
        })

        # The Sessions.create_session function is only needed if you are tracking
        # sessions in the database. If you do not want to store session data in the
        # database, remove this line, the Nomadize.Sessions alias and the
        # Nomadize.Sessions and Nomadize.Sessions.Session modules
        {:ok, %{id: session_id}} = Sessions.create_session(%{user_id: user.id})
        token = Token.sign(%{session_id: session_id})
        render(conn, "info.json", %{info: token})

      {:error, _message} ->
        error(conn, :unauthorized, 401)
    end
  end
end
