defmodule AdaAdaWeb.RegistrationController do
  use AdaAdaWeb, :controller

  alias AdaAda.User

  def signin(conn, %{"user" => %{"username" => user_id, "password" => pass}}) do
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

  def register(conn, %{"user" => info}) do
    case User.user_register(%User{}, info) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, info.user_id)
        |> redirect(to: "/")
      {:error, message} ->
        conn
        |> put_flash(:error, "invalid register")
    end
  end

  def require_user(conn, _) do
    if user = get_session(conn, :user_id) do
      conn
      |> assign(:user_id, user)
      |> assign(:user_token, Phoenix.Token.sign(conn, "user token", user))
    else
      conn
      |> put_view(AdaAdaWeb.RegistrationView)
      |> put_flash(:error, "Please signin!")
      |> render("signin.html", changeset: User.changeset(%User{}))
      |> halt()
    end
  end
end
