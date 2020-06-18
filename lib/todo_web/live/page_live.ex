defmodule ToDoWeb.PageLive do
  use ToDoWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", tasks: [])}
  end

  @impl true
  def handle_event("create", %{"title" => title}, socket) do
    IO.puts(title)
    {:noreply, assign(socket, tasks: [])}
  end
end
