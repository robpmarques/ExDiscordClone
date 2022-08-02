defmodule DiscordCloneWeb.UsersControllerTest do
  use DiscordCloneWeb.ConnCase

  describe "create_user" do
    test "creates a user with valid attrs", %{conn: conn} do
      user = string_params_for(:user)

      conn
      |> post(Routes.users_path(conn, :create), user)
      |> json_response(201)
    end

    test "does not create the user with invalid attrs", %{conn: conn} do
      user = string_params_for(:user, name: nil)

      conn
      |> post(Routes.users_path(conn, :create), user)
      |> json_response(400)
    end
  end

  describe "show_user" do
    test "shows the user", %{conn: conn} do
      %{id: user_id} = insert(:user)

      data =
        conn
        |> get(Routes.users_path(conn, :show, user_id))
        |> json_response(200)

      assert %{
               "id" => ^user_id,
               "name" => "Jane Smith",
               "email" => "email-0@example.com",
             } = data
    end
  end
end
