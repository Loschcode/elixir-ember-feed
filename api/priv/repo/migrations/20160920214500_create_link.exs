defmodule FeedApi.Repo.Migrations.CreateLink do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :title, :string
      add :description, :text
      add :url, :string
      add :source, :string
      add :published_at, :datetime

      timestamps()
    end

  end
end
