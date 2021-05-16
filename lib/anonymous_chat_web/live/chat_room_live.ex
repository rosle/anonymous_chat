defmodule AnonymousChatWeb.ChatRoomLive do
  use AnonymousChatWeb, :live_view

  alias AnonymousChat.Messages
  alias AnonymousChat.Messages.Message
  alias Phoenix.PubSub

  def mount(_, %{"username" => username}, socket) do
    if connected?(socket), do: PubSub.subscribe(AnonymousChat.PubSub, "chat_room")

    socket = assign(socket, :username, username)

    {:ok, socket, temporary_assigns: [messages: list_recent_messages()]}
  end

  def handle_info({:message_created, {:ok, %Message{} = message}}, socket) do
    {:noreply, assign(socket, :messages, [message])}
  end

  def handle_info(_, socket), do: {:noreply, socket}

  defp list_recent_messages do
    Messages.list_recent_messages()
    |> Enum.reverse()
  end
end
