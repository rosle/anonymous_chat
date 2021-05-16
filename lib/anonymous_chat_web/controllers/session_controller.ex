defmodule AnonymousChatWeb.SessionController do
  use AnonymousChatWeb, :controller

  alias AnonymousChatWeb.{ChatRoomLive, SetNameLive}

  def create(conn, %{"user" => %{"name" => username}}) do
    conn
    |> put_session(:username, username)
    |> redirect(to: Routes.live_path(conn, ChatRoomLive))
  end

  def delete(conn, _) do
    conn
    |> clear_session()
    |> configure_session(drop: true)
    |> redirect(to: Routes.live_path(conn, SetNameLive))
  end
end
