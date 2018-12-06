use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ada_ada, AdaAdaWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ada_ada, AdaAda.Repo,
  username: "postgres",
  password: "postgres",
  database: "ada_ada_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
