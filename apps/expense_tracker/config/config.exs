# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :expense_tracker, ecto_repos: [ExpenseTracker.Repo]

# Configures the endpoint
config :expense_tracker, ExpenseTrackerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7bt+I09jBk4yLyg0Hmc7qqeFFlAlE8hvrOHsTBQmLfzXLlVxGI/wJrPK42ARmyOR",
  render_errors: [view: ExpenseTrackerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: ExpenseTracker.PubSub,
  live_view: [signing_salt: "W87NQVcV"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
