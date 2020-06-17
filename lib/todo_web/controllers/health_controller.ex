defmodule ToDoWeb.HealthController do
  @moduledoc false
  use ToDoWeb, :controller

  def health(conn, _params) do
    json(conn, %{endpoint: "health", status: "👍🏻 💚"})
  end
end
