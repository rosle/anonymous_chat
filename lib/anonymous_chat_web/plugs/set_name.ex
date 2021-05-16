defmodule AnonymousChatWeb.Plugs.SetName do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    username = get_session(conn, :username)

    assign(conn, :username, username)
  end
end
