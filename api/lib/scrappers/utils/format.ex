defmodule FeedApi.Scrappers.Utils.Format do

  # format the Tweet by removing the URL and triming it
  def message(string) do
    String.replace(string, ~r/(?:f|ht)tps?:\/[^\s]+/, "") |> String.trim
  end

  def link(link) do
    {:ok, link} = link
    link
  end

  def date(date) do
    date
    |> Timex.parse!("%a %b %d %T %z %Y", :strftime)
    |> Ecto.DateTime.cast!
  end

end
