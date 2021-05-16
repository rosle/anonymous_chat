defmodule AnonymousChat.Messages do
  alias AnonymousChat.Messages.Message
  alias AnonymousChat.Repo

  def create_message(msg_attrs) do
    %Message{}
    |> Message.create_changeset(msg_attrs)
    |> Repo.insert()
  end
end
