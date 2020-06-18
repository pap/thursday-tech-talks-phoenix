defmodule TaskCardComponent do
  @moduledoc """
  Todo card component
  """

  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="card">
      <div class="card-content">
        <div class="title is-size-6"><%= assigns.task.title %></div>
      </div>
      <footer class="card-footer">
      <p class="card-footer-item">
      <%= assigns.task.inserted_at %>
      </p>
      <p class="card-footer-item">
        <span class="button is-small" phx-click="complete" phx-value-task-id="<%= assigns.task.id %>">
          Mark as Done
        </span>
      </p>
    </div>
    """
  end
end
