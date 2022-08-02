defmodule DiscordClone.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :email, :string, unique: true

      timestamps()
    end

    create unique_index("users", [:email], name: :email_for_users_duplicate_entries)
  end
end
