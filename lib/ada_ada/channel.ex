defmodule AdaAda.Channel do
  use Ecto.Schema
  import Ecto.Changeset


  schema "channels" do
    field :name, :string
    field :creator, :id
    field :members, :id
    field :messages, :id

    timestamps()
  end

  @doc false
  def changeset(channel, attrs) do
    channel
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
