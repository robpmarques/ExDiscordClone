defmodule DiscordCloneWeb.UsersController do
  use DiscordCloneWeb, :controller

  alias DiscordClone.Users
  alias DiscordCloneWeb.UsersView

  action_fallback DiscordCloneWeb.FallbackController

  def create(conn, params) do
    with {:ok, user} <- Users.create_user(params)  do
      conn
      |> put_status(:created)
      |> put_view(UsersView)
      |> render("user.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, user} = Users.show_user(id) do
      render(conn, "user.json", user: user)
    end
  end
end
