# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :feed_api,
  ecto_repos: [FeedApi.Repo]

# Configures the endpoint
config :feed_api, FeedApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "E9Udd12mRfh9RvsZZuGGfttvgbGCcJYVXeklsaTgHux7Nu9qb4+zomr8VdH91dzy",
  render_errors: [view: FeedApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: FeedApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures the Authentication system
config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "FeedApi",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: "4deJP8QzEVziW5ZSWDGxnE10dDEWQ2gYxxx19I1mrvnkSQ3DFllCsUcm9jC+3QXM",
  serializer: FeedApi.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
