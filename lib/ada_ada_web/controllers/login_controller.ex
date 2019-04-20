defmodule AdaAdaWeb.LoginController do
  use AdaAdaWeb, :controller

  alias AdaAda.User

  def index(conn, _) do
    render(conn, "index.html", changeset: User.changeset(%User{}))
  end

  def login(conn, %{"user" => info}) do
    user = User.get_user_by_id(info["user_id"])

    case Comeonin.Bcrypt.check_pass(user, info["user_id"]) do
      {:ok, user} ->
        conn
        |> put_session(:user_id, user.user_id)
        |> put_flash(:info, "Signed in successfully.")
        |> redirect(to: AdaAdaWeb.Router.Helpers.user_path(conn, :index))

      {:error, message} ->
        err_resp = [{:encrypted_password, message}]

        conn
        |> put_flash(:error, "There was a problem with your username / password")
        |> render("new.html", changeset: err_resp)
    end
  end
end
