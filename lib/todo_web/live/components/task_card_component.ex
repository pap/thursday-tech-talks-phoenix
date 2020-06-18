defmodule TaskCardComponent do
  @moduledoc """
  Todo card component
  """

  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="card">
      <header class="card-header">
        <p class="card-header-title is-size-7"><%= assigns.task.title %></p>
        <p class="card-header-icon is-size-7 has-text-grey"><%= assigns.task.created_at %></p>
        <%= if assigns.task.completed do %>
          ...
        <% else %>
          ...
        <% end %>
      </header>
    </div>
    """
  end
end
