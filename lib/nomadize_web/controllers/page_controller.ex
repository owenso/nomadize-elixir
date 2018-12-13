defmodule NomadizeWeb.PageController do
  use NomadizeWeb, :controller

  def index(conn, _params) do
    # render conn, "index.html"
    conn
    |> put_resp_header("content-type", "text/html; charset=utf-8")
    |> Plug.Conn.send_file(200, "priv/static/index.html")
    |> halt()
  end
end
