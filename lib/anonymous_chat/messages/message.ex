defmodule AnonymousChat.Messages.Message do
  use Ecto.Schema

  import Ecto.Changeset

  schema "messages" do
    field :username, :string
    field :content, :string

    timestamps()
  end

  def create_changeset(message, attrs) do
    message
    |> cast(attrs, [:username, :content])
    |> validate_required([:username, :content])
  end
end
