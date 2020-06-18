defmodule ToDo.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string, null: false, size: 140
      add :completed, :boolean, default: false, null: false

      timestamps()
    end
  end
end
