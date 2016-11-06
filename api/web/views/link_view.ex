defmodule FeedApi.LinkView do
  use FeedApi.Web, :view

  def render("index.json", %{links: links}) do
    %{links: render_many(links, FeedApi.LinkView, "link.json")}
  end

  def render("show.json", %{link: link}) do
    %{link: render_one(link, FeedApi.LinkView, "link.json")}
  end

  def render("link.json", %{link: link}) do
    %{id: link.id,
      title: link.title,
      description: link.description,
      url: link.url,
      source: link.source,
      published_at: link.published_at,
      inserted_at: link.inserted_at,
      updated_at: link.updated_at}
  end

  def render("feed.json", %{}) do
    %{}
  end

end
