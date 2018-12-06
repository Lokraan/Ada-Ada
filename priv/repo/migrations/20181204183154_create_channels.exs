defmodule AdaAda.Repo.Migrations.CreateChannels do
  use Ecto.Migration

  def change do
    create table(:channels) do
      add :name, :string
      add :creator, references(:users, on_delete: :nothing)
      add :members, references(:users, on_delete: :nothing)
      add :messages, references(:messages, on_delete: :nothing)

      timestamps()
    end

    create index(:channels, [:creator])
    create index(:channels, [:members])
    create index(:channels, [:messages])
  end
end
