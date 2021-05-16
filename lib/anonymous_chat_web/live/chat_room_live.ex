defmodule AnonymousChatWeb.ChatRoomLive do
  use AnonymousChatWeb, :live_view

  def mount(_, _, socket) do
    {:ok, socket}
  end
end
