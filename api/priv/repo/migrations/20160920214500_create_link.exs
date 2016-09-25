defmodule FeedApi.Repo.Migrations.CreateLink do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :title, :string
      add :description, :text
      add :url, :string

      timestamps()
    end

  end
end
