defmodule AdaAda.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias AdaAda.{Ada, Repo, User}

  @type t :: %User{
    bio: String.t(),
    display_name: String.t(),
    email: String.t(),
    user_id: String.t(),
    password_hash: String.t()
  }

  schema "users" do
    field :bio, :string
    field :display_name, :string
    field :email, :string
    field :user_id, :string
    field :password, :string
    field :password_hash, :string

    timestamps()
  end

  @fields ~w(display_name email user_id password)a

  @doc false
  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, @fields)
  end

  def verify_changeset(%Ecto.Changeset{valid?: true} = changeset) do
    changeset
    |> validate_required(@fields)
    |> validate_password(:password)
    |> unique_constraint(:user_id)
    |> put_pass_hash()
  end

  def user_register(%User{} = user, attrs \\ %{}) do
    changeset(user, attrs)
    |> verify_changeset()
    |> Repo.insert()
  end

  def validate_user_login(user_id, password) do
    Repo.get_by(User, user_id: user_id)
    |> Comeonin.Argon2.check_pass(password)
  end

  defp put_pass_hash(%Ecto.Changeset{valid?: true, changes:
      %{password: password}} = changeset) do

    change(changeset, Comeonin.Argon2.add_hash(password))
  end

  defp put_pass_hash(changeset), do: changeset

  def validate_password(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, password -> 
      case valid_password?(password) do
        {:ok, _} 
          -> []
        {:error, msg} ->
          [{field, options[:message] || msg}]
        end
    end)
  end

  defp valid_password?(password) when byte_size(password) > 5 do
    {:ok, password}
  end

  defp valid_password?(_), do: {:error, "The password is too short (at least length 6)"}
end
