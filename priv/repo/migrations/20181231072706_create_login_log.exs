defmodule Nomadize.Repo.Migrations.CreateLoginLog do
  use Ecto.Migration

  def change do
    create table(:login_log) do
      add :ip_address, :string
      add :login_timestamp, :utc_datetime
      # add :user_id, references(:users, on_delete: :nothing)
      add(:user_id, references(:users, on_delete: :delete_all))

      # timestamps()
    end

    drop table(:logins)

    create index(:login_log, [:user_id])
  end
end
