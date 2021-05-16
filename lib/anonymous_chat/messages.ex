defmodule AnonymousChat.Messages do
  import Ecto.Query

  alias AnonymousChat.Messages.Message
  alias AnonymousChat.Repo
  alias Phoenix.PubSub

  @recent_messages_limit 10

  def list_recent_messages do
    Message
    |> order_by(desc: :inserted_at)
    |> limit(@recent_messages_limit)
    |> Repo.all()
  end

  def create_message(msg_attrs) do
    %Message{}
    |> Message.create_changeset(msg_attrs)
    |> Repo.insert()
    |> notify_subscribers(:message_created)
  end

  defp notify_subscribers(repo_result, event) do
    PubSub.broadcast(AnonymousChat.PubSub, "chat_room", {event, repo_result})

    repo_result
  end
end
