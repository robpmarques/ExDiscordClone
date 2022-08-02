defmodule DiscordCloneWeb.UsersControllerTest do
  use DiscordCloneWeb.ConnCase

  describe "create_user" do
    test "creates a user with valid attrs", %{conn: conn} do
      user = string_params_for(:user)

      %{"id" => id} =
        conn
        |> post(Routes.users_path(conn, :create), user)
        |> json_response(201)
    end

    test "redirects to show when data is valid", %{conn: conn} do
      user = string_params_for(:user)

      %{"id" => id} =
        conn
        |> post(Routes.users_path(conn, :create), user)
        |> json_response(201)

      data =
        conn
        |> get(Routes.users_path(conn, :show, id))
        |> json_response(200)

      assert %{
               "id" => ^id,
               "name" => "Jane Smith",
               "email" => "email-0@example.com",
             } = data
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
