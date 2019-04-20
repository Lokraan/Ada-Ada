defmodule AdaAda.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias AdaAda.{Ada, Repo, User}

  @type t :: %User{
    bio: String.t(),
    display_name: String.t(),
    user_id: String.t(),
    encrypted_password: String.t()
  }

  schema "users" do
    field :bio, :string
    field :display_name, :string
    field :user_id, :string
    field :encrypted_password, :string

    has_many :adas, Ada

    timestamps()
  end

  @fields ~w(bio display_name user_id encrypted_password)a

  @doc false
  def changeset(%User{} = user, attrs \\ %{}) do
    user
    |> cast(attrs, @fields)
    |> unique_constraint(:user_id)
    |> validate_required([:user_id, :display_name, :encrypted_password])
    |> validate_password(:encrypted_password)
    |> update_change(:encrypted_password, &Bcrypt.hash_pwd_salt/1)
  end

  def user_register(%User{} = user, attrs \\ %{}) do
    changeset(user, attrs)
    |> Repo.insert()
  end

  def get_user_by_id(user_id) do
    Repo.get_by(User, user_id: user_id)
  end

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
