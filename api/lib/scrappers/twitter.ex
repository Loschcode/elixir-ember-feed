defmodule FeedApi.Scrappers.Twitter do

  @tweets 10

  @doc """
  Some comments or something
  """
  def dispatch! do
    ExTwitter.user_timeline(count: @tweets) |> stream_catch
  end

  defp stream_catch(stream) do
    for data <- stream do
      handle(data) |> format
    end
  end

  defp _parse(term) when is_atom(term), do: term

  defp format(string) do
    IO.inspect "hey #{string}"
  end

  # defp handle(data = %ExTwitter.Model.Tweet), do: data.text

  defp handle(data = %ExTwitter.Model.Tweet{}), do: data.text
  defp handle(_), do: nil

end
