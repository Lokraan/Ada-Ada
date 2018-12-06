defmodule AdaAdaWeb.PageController do
  use AdaAdaWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
