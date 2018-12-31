# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# It is also run when you use `mix ecto.setup` or `mix ecto.reset`
#

users = [
  %{email: "jane.doe@example.com", password: "password", provider: "local"},
  %{email: "john.smith@example.org", password: "password", provider: "local"},
  %{email: "admin@admin.com", password: "adminpassword", role: "admin", provider: "local"}
]

for user <- users do
  {:ok, user} = Nomadize.Accounts.create_user(user)
  Nomadize.Accounts.confirm_user(user)
end
