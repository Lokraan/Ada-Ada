defmodule AdaAda.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :user_id, :string
      add :display_name, :string
      add :bio, :string
      add :encrypted_password, :string

      timestamps()
    end
  end
end
