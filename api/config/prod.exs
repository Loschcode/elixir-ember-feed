use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :feed_api, FeedApi.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  server: true,
  code_reloader: false,
  cache_static_lookup: false,
  check_origin: false,
  watchers: []

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Finally import the config/prod.secret.exs
# which should be versioned separately.
import_config "prod.secret.exs"
