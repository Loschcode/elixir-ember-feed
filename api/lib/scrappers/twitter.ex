defmodule FeedApi.Scrappers.Twitter do

  @tweets 100

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

  # format the Tweet by removing the URL and triming it
  defp format_message(string) do
    String.replace(string, ~r/(?:f|ht)tps?:\/[^\s]+/, "") |> String.trim
  end

  defp format_link(link) do
    {:ok, link} = link
    link
  end

  defp format_date(date) do
    # this has to be really improved
    # or find another way to make it
    <<
    _::bytes-size(3),
    " ",
    month::bytes-size(3),
    " ",
    day::bytes-size(2),
    " ",
    time::bytes-size(8),
    " ",
    tz::bytes-size(5),
    " ",
    year::bytes-size(4)>> = date

    month = case month do
      "Jan" -> "01"
      "Feb" -> "02"
      "Mar" -> "03"
      "Apr" -> "04"
      "May" -> "05"
      "Jun" -> "06"
      "Jul" -> "07"
      "Aug" -> "08"
      "Sep" -> "09"
      "Oct" -> "10"
      "Nov" -> "11"
      "Dec" -> "12"
    end

    {:ok, final_date} = Ecto.DateTime.cast("#{year}-#{month}-#{day}T#{time}Z")
    final_date

  end

  defp link(data) do
    urls = data.entities.urls
    IO.inspect urls
    unless (urls == []) do
      List.first(urls) |> Map.fetch(:expanded_url) |> format_link
    end
  end

  defp date(data) do
    data.created_at |> format_date
  end

  defp message(data) do
    data.text |> format_message
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

end
