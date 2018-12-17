defmodule NomadizeWeb.Router do
  use NomadizeWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)

    plug(
      Plug.Static,
      at: "/",
      from: :nomadize,
      gzip: false,
      only: ~w(css fonts images img js favicon.ico robots.txt)
    )
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", NomadizeWeb do
    # Use the default browser stack
    pipe_through(:browser)

    # get "/", PageController, :index
    get("/*anything", PageController, :index)
  end

  # Other scopes may use custom stacks.
  # scope "/api", NomadizeWeb do
  #   pipe_through :api
  # end
end
