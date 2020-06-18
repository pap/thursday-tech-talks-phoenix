defmodule NewTaskComponent do
  @moduledoc """
  Form to create new tasks
  """

  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <div class="content">
      <form phx-submit="create">
        <div class="field is-grouped">
          <input class="input is-medium is-info" type="text" placeholder="What do you need to get done?" name="title">
          <input class="button is-medium is-info" type="submit" value="Create task">
        </div>
      </form>
    </div>
    """
  end
end
