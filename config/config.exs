# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :kickstarter,
  ecto_repos: [Kickstarter.Repo]

# Configures the endpoint
config :kickstarter, Kickstarter.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ZfMsKjZ2tXx6OKD81oQvTdyYXVKvVOkymF0+IHWiTN7Fvp4C43bqogPd0nRL0hav",
  render_errors: [view: Kickstarter.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Kickstarter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Locale
config :kickstarter, Kickstarter.Web.Gettext,
  default_locale: "zh_CN"

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

config :xain, :after_callback, {Phoenix.HTML, :raw}

# ExAdmin
config :ex_admin,
  repo: Kickstarter.Repo,
  module: Kickstarter.Web,
  modules: [
    Kickstarter.ExAdmin.Dashboard,
  ]


# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Kickstarter.Coherence.User,
  repo: Kickstarter.Repo,
  module: Kickstarter,
  router: Kickstarter.Web.Router,
  messages_backend: Kickstarter.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: "Your Name",
  email_from_email: "yourname@example.com",
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :confirmable, :registerable]

config :coherence, Kickstarter.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here",
  site_name: "华北电力大学创业之家"
# %% End Coherence Configuration %%

