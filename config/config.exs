# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :services_api,
  ecto_repos: [ServicesApi.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :services_api, ServicesApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lERMXgmYdB6miWtFJ8WUfPNfEci3YUWdGp8/1X8Zi78fljCQ5BfB7IT9tCs7gs+b",
  render_errors: [view: ServicesApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ServicesApi.PubSub,
  live_view: [signing_salt: "np7nptHL"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
