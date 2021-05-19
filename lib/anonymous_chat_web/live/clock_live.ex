defmodule AnonymousChatWeb.ClockLive do
  use AnonymousChatWeb, :live_view

  def mount(_, _, socket) do
    if connected?(socket), do: :timer.send_interval(1000, self(), "tick")

    {:ok, assign(socket, :now, DateTime.utc_now())}
  end

  def handle_info("tick", socket) do
    {:noreply, assign(socket, :now, DateTime.utc_now())}
  end
end
