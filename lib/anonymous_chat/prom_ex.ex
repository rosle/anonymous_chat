defmodule AnonymousChat.PromEx do
  use PromEx, otp_app: :anonymous_chat

  alias PromEx.Plugins

  @impl true
  def plugins do
    [
      # PromEx built in plugins
      Plugins.Application,
      Plugins.Beam,
      {Plugins.Phoenix, router: AnonymousChatWeb.Router},
      Plugins.Ecto,
      # Plugins.Oban,
      Plugins.PhoenixLiveView

      # Add your own PromEx metrics plugins
      # AnonymousChat.Users.PromExPlugin
    ]
  end

  @impl true
  def dashboard_assigns do
    [
      datasource_id: "grafanacloud-nimblegrowth36-prom"
    ]
  end

  @impl true
  def dashboards do
    [
      # PromEx built in Grafana dashboards
      {:prom_ex, "application.json"},
      {:prom_ex, "beam.json"},
      {:prom_ex, "phoenix.json"},
      {:prom_ex, "ecto.json"},
      # {:prom_ex, "oban.json"},
      {:prom_ex, "phoenix_live_view.json"}

      # Add your dashboard definitions here with the format: {:otp_app, "path_in_priv"}
      # {:anonymous_chat, "/grafana_dashboards/user_metrics.json"}
    ]
  end
end
