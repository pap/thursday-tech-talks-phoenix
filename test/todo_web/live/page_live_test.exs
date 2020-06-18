defmodule ToDoWeb.PageLiveTest do
  use ToDoWeb.ConnCase

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    conn =
      put_req_header(
        conn,
        "authorization",
        "Basic " <> Base.encode64("#{username()}:#{password()}")
      )

    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "Welcome to Phoenix!"
    assert render(page_live) =~ "Welcome to Phoenix!"
  end

  defp username(), do: System.get_env("USERNAME")
  defp password(), do: System.get_env("PASSWORD")
end
