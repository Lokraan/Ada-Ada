defmodule AdaAdaWeb.PageController do
  use AdaAdaWeb, :controller

  import AdaAdaWeb.RegistrationController, only: [require_user: 2]

  plug :require_user

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
