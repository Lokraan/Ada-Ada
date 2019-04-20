defmodule AdaAdaWeb.UserController do
  use AdaAdaWeb, :controller

  import AdaAda.Repo, only: [get_all_users: 0]

  def index(conn, _params) do
    render(conn, "index.html", users: get_all_users())
  end

  def profile(conn, _params) do
    render(conn, "index.html", users: get_all_users())
  end
end
