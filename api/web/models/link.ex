defmodule FeedApi.Link do
  use FeedApi.Web, :model
  use Ecto.Schema

  schema "links" do
    field :title, :string
    field :description, :string
    field :url, :string
    field :source, :string
    field :published_at, Ecto.DateTime

    timestamps()
  end

  @required_fields ~w(title description url source)
  @optional_fields ~w()

  def sort_by_publication(query) do
  from link in query,
    order_by: [desc: link.published_at]
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :url, :source, :published_at])
    |> validate_required([:title, :description, :url])
  end
end
