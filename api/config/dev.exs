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
  code_reloader: true,
  check_origin: false,
  watchers: []

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configures Twitter scrapper
config :extwitter, :oauth, [
  consumer_key: "XpJxYdMfgLjyFSUhpoCsJwrfV",
  consumer_secret: "6vaXnm815waV1snR5y1JQR9tfN4SYGqIxPBfrVWPYbEfiuJaw2",
  access_token: "736601629-1kPVfiEkWpsIdK8TZMtANCBkntGofsZuQtA3cLX5",
  access_token_secret: "jKvZIJ6KjWHKf1iq2oySP3uMcl1LknzSSq2cLmd1yoQq9"
]
