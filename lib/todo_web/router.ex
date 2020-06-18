defmodule ToDoWeb.Router do
  use ToDoWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {ToDoWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :admin_user do
    import Plug.BasicAuth

    plug :basic_auth,
      username: System.get_env("ADMIN_USERNAME"),
      password: System.get_env("ADMIN_PASSWORD")
  end

  pipeline :regular_user do
    import Plug.BasicAuth

    plug :basic_auth,
      username: System.get_env("USERNAME"),
      password: System.get_env("PASSWORD")
  end

  scope "/", ToDoWeb do
    pipe_through :api

    get "/health", HealthController, :health
  end

  scope "/", ToDoWeb do
    pipe_through [:regular_user, :browser]

    live "/", PageLive, :index
  end

  scope "/" do
    import Phoenix.LiveDashboard.Router

    pipe_through [:admin_user, :browser]

    live_dashboard "/dashboard",
      metrics: HermesWeb.Telemetry
  end
end
