defmodule ConnectrixWeb.PageController do
  use ConnectrixWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
