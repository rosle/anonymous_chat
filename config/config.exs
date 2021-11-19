# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :anonymous_chat,
  ecto_repos: [AnonymousChat.Repo]

# Configures the endpoint
config :anonymous_chat, AnonymousChatWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "5hOnSRorHib0wKuKPM8qrTHfnHb+FLwp3njXHUAGcGTSBXjuJ/wCuKiqjDyKima8",
  render_errors: [view: AnonymousChatWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: AnonymousChat.PubSub,
  live_view: [signing_salt: "iD68wR9s"]

config :anonymous_chat, AnonymousChat.PromEx,
  disabled: true,
  grafana: :disabled

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
