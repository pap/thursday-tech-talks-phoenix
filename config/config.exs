# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todo,
  namespace: ToDo,
  ecto_repos: [ToDo.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :todo, ToDoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lAmI6GA/RhhIkJ6HeNsT2W7PTi3Udu0lejTQOyR4tXI6sR9+10BohfsFQR5xiO5k",
  render_errors: [view: ToDoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ToDo.PubSub,
  live_view: [signing_salt: "y1+u5B5m"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
