defmodule AnonymousChatWeb.ChatRoom.ChatFormComponent do
  use AnonymousChatWeb, :live_component

  alias AnonymousChat.Messages
  alias AnonymousChat.Messages.Message

  def mount(socket) do
    changeset = Message.create_changeset(%Message{}, %{})

    {:ok, assign(socket, :changeset, changeset)}
  end

  def handle_event("validate", %{"message" => msg_params}, socket) do
    changeset =
      %Message{}
      |> Message.create_changeset(msg_params)
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"message" => msg_params}, socket) do
    case Messages.create_message(msg_params) do
      {:ok, %Message{}} ->
        changeset = Message.create_changeset(%Message{}, %{})

        {:noreply, assign(socket, :changeset, changeset)}

      {:error, %Ecto.Changeset{}} ->
        # TODO: Check flash not shown
        {:noreply, put_flash(socket, :error, "Something went wrong, Please try again.")}
    end
  end
end
