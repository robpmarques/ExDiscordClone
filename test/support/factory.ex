defmodule DiscordCloneWeb.Factory do
  use ExMachina.Ecto, repo: DiscordClone.Repo

  alias DiscordClone.Users.User

  def user_factory do
    %User{
      name: "Jane Smith",
      email: sequence(:email, &"email-#{&1}@example.com"),
    }
  end
end
