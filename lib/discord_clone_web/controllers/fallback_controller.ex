defmodule DiscordCloneWeb.FallbackController do
  use DiscordCloneWeb, :controller

  alias DiscordCloneWeb.ErrorView
  alias DiscordClone.Error

  def call(conn, %Error{status: status, message: message}) do
    conn
    |> put_status(status)
    |> put_view(ErrorView)
    |> render("error.json", %{message: message})
  end

  def call(conn, %Ecto.Changeset{} = changeset) do
    conn
    |> put_status(:bad_request)
    |> put_view(ErrorView)
    |> render("400.json", %{changeset: changeset})
  end
end
