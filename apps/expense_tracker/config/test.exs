use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :expense_tracker, ExpenseTrackerWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

config :expense_tracker, ExpenseTracker.Repo,
  username: "postgres",
  password: "postgres",
  database: "expense_tracker_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  port: 15432

