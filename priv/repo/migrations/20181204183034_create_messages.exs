defmodule AdaAda.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :content, :string
      add :author, references(:users, on_delete: :nothing)
      add :channel, references(:channels, on_delete: :nothing)

      timestamps()
    end

    create index(:messages, [:author])
    create index(:messages, [:channel])
  end
end
