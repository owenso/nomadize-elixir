defmodule NomadizeWeb.ConfirmView do
  use NomadizeWeb, :view

  def render("info.json", %{info: message}) do
    %{info: %{detail: message}}
  end
end
