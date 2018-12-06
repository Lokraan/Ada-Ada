# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ada_ada,
  ecto_repos: [AdaAda.Repo]

# Configures the endpoint
config :ada_ada, AdaAdaWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TD8Rao35fK8aXPPDStH1UdXBFbs+s6aZnAp+h/VN+6UUSwmr3jd+qIMGfsLwCiMp",
  render_errors: [view: AdaAdaWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AdaAda.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
