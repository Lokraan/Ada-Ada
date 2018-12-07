defmodule AdaAda.Ada do
  use Ecto.Schema
  import Ecto.Changeset


  schema "adas" do
    field :content, :string
    field :ada_id, :string

    belongs_to :user, AdaAda.User
    
    timestamps()
  end

  @doc false
  def changeset(ada, attrs) do
    ada
    |> cast(attrs, [:id, :content])
    |> validate_required([:id, :content])
  end
end
