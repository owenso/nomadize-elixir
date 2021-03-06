# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :nomadize,
  ecto_repos: [Nomadize.Repo]

# Configures the endpoint
config :nomadize, NomadizeWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "GnNaM6qApX5ejhFrn84M3oAX8W4lzDz2rZlDPN5foxutSyaHarwetxyINvuFXjW5",
  render_errors: [view: NomadizeWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Nomadize.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Phauxth authentication configuration
config :phauxth,
  user_context: Nomadize.Accounts,
  crypto_module: Comeonin.Argon2,
  token_module: NomadizeWeb.Auth.Token

# Mailer configuration
config :nomadize, NomadizeWeb.Mailer,
  adapter: Bamboo.LocalAdapter

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
