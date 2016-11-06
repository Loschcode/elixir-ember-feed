defmodule FeedApi.Scrappers.Twitter do

  alias FeedApi.Scrappers.Utils.Format

  @tweets 1000

  @doc """
  We try to get the tweets from the timeline of the user
  It will fetch all the needed datas and return them into an array
  """
  def dispatch! do
    ExTwitter.user_timeline(count: @tweets) |> fetch
  end

  # we fetch the stream and return all the datas we need
  # which are the message, link and date of creation of the Tweet
  defp fetch(stream) do
    for data <- stream do
      handle(data)
    end
  end

  # get only the data needed in our system from the Tweet
  defp handle(data = %ExTwitter.Model.Tweet{}) do
    %{
      message: message(data),
      link: link(data),
      date: date(data)
    }
  end


  # get only the data needed in our system from the User
  defp handle(data = %ExTwitter.Model.User{}) do
    %{
      created_at: data.created_at
    }
  end

  # null object pattern
  defp handle(_) do
    %{
      tweet: nil,
      link: nil,
      date: nil
    }
  end

  defp link(data) do
    urls = data.entities.urls
    unless (length(urls)) do
      List.first(urls) |> Map.fetch(:expanded_url) |> Format.link
    end
  end

  defp date(data) do
    data.created_at |> Format.date
  end

  defp message(data) do
    data.text |> Format.message
  end

end
