defmodule AdaAdaWeb.RegistrationController do
  use AdaAdaWeb, :controller

  alias AdaAda.User

  def index(conn, _) do
    render(conn, "index.html", changeset: User.changeset(%User{}))
  end

  def register(conn, %{"user" => info}) do
    info_atoms = Map.new(info, fn {k, v} -> {String.to_atom(k), v} end)
    case User.user_register(%User{}, info_atoms) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, user.user_id)
        |> redirect(to: "/")
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Invalid registration data!")
        |> render("index.html", changeset: changeset)
    end
  end

  def require_user(conn, _) do
    if user = get_session(conn, :user_id) do
      conn
      |> assign(:user_id, user)
      |> assign(:user_token, Phoenix.Token.sign(conn, "user token", user))
    else
      conn
      |> put_view(AdaAdaWeb.LoginView)
      |> put_flash(:error, "Please signin!")
      |> render("index.html", changeset: User.changeset(%User{}))
      |> halt()
    end
  end
end
