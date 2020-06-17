defmodule ToDoWeb.RoutingTest do
  @moduledoc false
  use ToDoWeb.ConnCase

  @endpoint ToDoWeb.Endpoint

  describe "admin user" do
    test "admin users can access dashboard", %{conn: conn} do
      conn = put_req_header(conn, "authorization", "Basic " <> admin_auth())

      assert conn |> get("/dashboard/nonode@nohost/home") |> html_response(200) =~
               ~s|phx-socket="/live"|
    end

    test "admin users cannot access main page", %{conn: conn} do
      conn = put_req_header(conn, "authorization", "Basic " <> admin_auth())
      assert %{status: 401} = get(conn, "/")
    end
  end

  describe "regular user" do
    test "regular users cannot access dashboard", %{conn: conn} do
      conn = put_req_header(conn, "authorization", "Basic " <> user_auth())

      assert %{status: 401} = get(conn, "/dashboard/nonode@nohost/home")
    end

    test "regular users can access main page", %{conn: conn} do
      conn = put_req_header(conn, "authorization", "Basic " <> user_auth())

      assert %{status: 200} = get(conn, "/")
    end
  end

  describe "api pipeline endpoints" do
    test "heatlh endpoint", %{conn: conn} do
      conn = put_req_header(conn, "accept", "application/json")
      conn = get(conn, Routes.health_path(conn, :health))

      assert json_response(conn, 200) == "ok"
    end
  end

  defp admin_auth, do: Base.encode64("#{admin_username()}:#{admin_password()}")
  defp user_auth, do: Base.encode64("#{username()}:#{password()}")
  defp admin_username(), do: System.get_env("ADMIN_USERNAME")
  defp admin_password(), do: System.get_env("ADMIN_PASSWORD")
  defp username(), do: System.get_env("USERNAME")
  defp password(), do: System.get_env("PASSWORD")
end
