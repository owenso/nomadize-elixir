defmodule Nomadize.Repo.Migrations.CreateLogins do
  use Ecto.Migration

  def change do
    create table(:logins) do
      add :ip_address, :string
      add :last_login, :utc_datetime
      add(:user_id, references(:users, on_delete: :delete_all))
      # timestamps()
    end

  end
end
