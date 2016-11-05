defmodule FeedApi.Scrappers.Twitter do

  @tweets 1

  @doc """
  Some comments or something
  """
  def dispatch! do
    ExTwitter.user_timeline(count: @tweets) |> fetch
  end

  @doc """
  We fetch the stream and return all the datas we need
  Which are the message, link and date of creation of the Tweet
  """
  defp fetch(stream) do
    for data <- stream do
      IO.inspect handle(data)
    end
  end

  @doc """
  Format the Tweet by removing the URL and triming it
  """
  defp format(string) do
    String.replace(string, ~r/(?:f|ht)tps?:\/[^\s]+/, "") |> String.trim
  end

  @doc """
  Get only the data needed in our system from the Tweet
  """
  defp handle(data = %ExTwitter.Model.Tweet{}) do
    IO.inspect format(data.text)
    %{
      message: format(data.text),
      link: List.first(data.entities.urls).expanded_url,
      date: handle(data.user).created_at
    }
  end

  @doc """
  Get only the data needed in our system from the User
  """
  defp handle(data = %ExTwitter.Model.User{}) do
    %{
      created_at: data.created_at
    }
  end

  @doc """
  Null Object Pattern
  """
  defp handle(_) do
    %{
      tweet: nil,
      link: nil,
      date: nil
    }
  end

end
