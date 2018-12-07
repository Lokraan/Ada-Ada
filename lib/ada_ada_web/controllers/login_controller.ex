defmodule AdaAdaWeb.LoginController do
  use AdaAdaWeb, :controller

  alias AdaAda.User

  def index(conn, _) do
    render(conn, "index.html", changeset: User.changeset(%User{}))
  end

  def login(conn, %{"user" => %{"email" => user_id, "password" => pass}}) do
    case User.validate_user_login(user_id, pass) do
      {:ok, user} ->  
        conn
        |> put_session(:user_id, user_id)
        |> redirect(to: "/")
      {:error, message} ->
        conn
        |> put_flash(:error, "invalid login")
    end
  end
end
