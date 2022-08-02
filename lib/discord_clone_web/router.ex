defmodule DiscordCloneWeb.Router do
  use DiscordCloneWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api/v1/users", DiscordCloneWeb do
    pipe_through :api

    resources "/", UsersController, except: [:edit, :new]
  end
end
