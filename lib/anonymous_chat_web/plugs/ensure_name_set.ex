defmodule AnonymousChatWeb.Plugs.EnsureNameSet do
  import Phoenix.Controller, only: [redirect: 2]
  import Plug.Conn

  alias AnonymousChatWeb.Router.Helpers, as: Routes
  alias AnonymousChatWeb.SetNameLive

  def init(opts), do: opts

  def call(%Plug.Conn{assigns: %{username: username}} = conn, _opts)
      when is_binary(username) and username != "" do
    conn
  end

  def call(conn, _opts) do
    IO.inspect get_session(conn, :username)

    conn
    |> redirect(to: Routes.live_path(conn, SetNameLive))
    |> halt()

    halt(conn)
  end
end
