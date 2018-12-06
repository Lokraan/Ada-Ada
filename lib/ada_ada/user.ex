defmodule AdaAda.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :bio, :string
    field :display_name, :string
    field :email, :string
    field :name, :string
    field :password, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :display_name, :email, :bio, :password])
    |> validate_required([:name, :display_name, :email, :bio, :password])
  end
end
