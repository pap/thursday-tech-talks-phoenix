defmodule ToDoWeb.PageLive do
  use ToDoWeb, :live_view

  @topic "tasks"

  @impl true
  def mount(_params, _session, socket) do
    ToDoWeb.Endpoint.subscribe(@topic)
    {:ok, assign(socket, query: "", tasks: tasks())}
  end

  @impl true
  def handle_event("create", %{"title" => title}, socket) do
    ToDo.Tasks.create_task(%{title: title})
    ToDoWeb.Endpoint.broadcast_from!(self(), @topic, "created", %{})
    {:noreply, assign(socket, tasks: tasks())}
  end

  def handle_event("complete", %{"task-id" => task_id}, socket) do
    task = ToDo.Tasks.get_task!(task_id)
    ToDo.Tasks.update_task(task, %{completed: true})
    ToDoWeb.Endpoint.broadcast_from!(self(), @topic, "completed", %{})
    {:noreply, assign(socket, tasks: tasks())}
  end

  @impl true
  def handle_info(%{event: _event}, socket) do
    {:noreply, assign(socket, tasks: tasks())}
  end

  defp tasks do
    ToDo.Tasks.list_tasks([{:completed, false}])
  end
end
