defmodule AdaAda.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_id, :string
      add :display_name, :string
      add :email, :string
      add :bio, :string
      add :password, :string
      add :adas, references(:adas, on_delete: :nothing)

      timestamps()
    end

    create index(:users, [:adas])
  end
end
