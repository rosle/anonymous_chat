defmodule AnonymousChat.Repo do
  use Ecto.Repo,
    otp_app: :anonymous_chat,
    adapter: Ecto.Adapters.Postgres
end
