defmodule Nomadize.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:email, :string, null: false)
      add(:password_hash, :string)
      add(:role, :string)
      add(:confirmed_at, :utc_datetime)
      add(:reset_sent_at, :utc_datetime)

      timestamps()
    end

    create unique_index :users, [:email]
  end
end
