defmodule AdaAda.Repo.Migrations.CreateAdas do
  use Ecto.Migration

  def change do
    create table(:adas) do
      add :ada_id, :string
      add :content, :string
      add :user_id, references(:users)

      timestamps()
    end

    create index(:adas, [:user_id])
  end
end
