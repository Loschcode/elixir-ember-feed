defmodule FeedApi.Scrappers.Twitter do

  @tweets 1

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
      IO.inspect handle(data)
    end
  end

  # format the Tweet by removing the URL and triming it
  defp format(string) do
    String.replace(string, ~r/(?:f|ht)tps?:\/[^\s]+/, "") |> String.trim
  end

  # get only the data needed in our system from the Tweet
  defp handle(data = %ExTwitter.Model.Tweet{}) do
    IO.inspect format(data.text)
    %{
      message: format(data.text),
      link: List.first(data.entities.urls).expanded_url,
      date: handle(data.user).created_at
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

end
