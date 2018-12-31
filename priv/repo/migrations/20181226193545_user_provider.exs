defmodule Nomadize.Repo.Migrations.UserLastSeen do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:provider, :string, default: "local")
    end
  end
end
