defmodule DiscordClone.Users do

  alias DiscordClone.Users.User
  alias DiscordClone.Repo

  def create_user(create_attrs) do
    create_attrs
    |> User.changeset()
    |> Repo.insert()
  end

  def update_user(user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def show_user(user_id) do
    case Repo.get(User, user_id) do
      %User{} = user ->
        {:ok, user}

      nil ->
        {:error, :user_not_found}
    end
  end
end
