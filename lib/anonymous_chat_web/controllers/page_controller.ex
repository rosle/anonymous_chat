defmodule AnonymousChatWeb.PageController do
  use AnonymousChatWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
