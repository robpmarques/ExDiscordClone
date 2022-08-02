defmodule DiscordClone.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:name, :email]

  @primary_key {:id, :binary_id, autogenerate: true}
  schema "users" do
    field :name, :string
    field :email, :string

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, params) do
    user
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email, name: :email_for_users_duplicate_entries)
  end
end
