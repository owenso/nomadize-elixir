defmodule NomadizeWeb.SessionView do
  use NomadizeWeb, :view

  def render("info.json", %{info: token}) do
    %{access_token: token}
  end
end
