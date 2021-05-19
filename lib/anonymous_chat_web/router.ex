defmodule AnonymousChatWeb.Router do
  use AnonymousChatWeb, :router

  alias AnonymousChatWeb.Plugs

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {AnonymousChatWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Plugs.SetName
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AnonymousChatWeb do
    pipe_through :browser

    live "/welcome", SetNameLive

    live "/counter", CounterLive
    live "/clock", ClockLive

    resources "/sessions", SessionController, only: [:create, :delete]
  end

  scope "/", AnonymousChatWeb do
    pipe_through [
      :browser,
      Plugs.EnsureNameSet
    ]

    live "/", ChatRoomLive
  end

  # Other scopes may use custom stacks.
  # scope "/api", AnonymousChatWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: AnonymousChatWeb.Telemetry
    end
  end
end
