defmodule AnonymousChatWeb.CounterLive do
  use AnonymousChatWeb, :live_view

  def mount(_, _, socket) do
    {:ok, assign(socket, :count, 0)}
  end

  def handle_event("add", %{"count" => count}, socket) do
    updated_count = socket.assigns.count + String.to_integer(count)

    {:noreply, assign(socket, :count, updated_count)}
  end

  def handle_event("add", _, socket) do
    updated_count = socket.assigns.count + 1

    {:noreply, assign(socket, :count, updated_count)}
  end
end
