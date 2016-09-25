defmodule FeedApi.Link do
  use FeedApi.Web, :model

  schema "links" do
    field :title, :string
    field :description, :string
    field :url, :string

    timestamps()
  end

  @required_fields ~w(title description url)
  @optional_fields ~w()

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :url])
    |> validate_required([:title, :description, :url])
  end
end
