defmodule Nomadize.Repo.Migrations.ChangeColumnLogins do
  use Ecto.Migration

  def change do
    rename table(:logins), :last_login, to: :login_timestamp
  end
end
