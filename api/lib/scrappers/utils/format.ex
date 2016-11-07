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

    # # this has to be really improved
    # # or find another way to make it
    # <<
    # _::bytes-size(3),
    # " ",
    # month::bytes-size(3),
    # " ",
    # day::bytes-size(2),
    # " ",
    # time::bytes-size(8),
    # " ",
    # tz::bytes-size(5),
    # " ",
    # year::bytes-size(4)>> = date
    #
    # month = case month do
    #   "Jan" -> "01"
    #   "Feb" -> "02"
    #   "Mar" -> "03"
    #   "Apr" -> "04"
    #   "May" -> "05"
    #   "Jun" -> "06"
    #   "Jul" -> "07"
    #   "Aug" -> "08"
    #   "Sep" -> "09"
    #   "Oct" -> "10"
    #   "Nov" -> "11"
    #   "Dec" -> "12"
    # end

    # {:ok, final_date} = Ecto.DateTime.cast("#{year}-#{month}-#{day}T#{time}Z")
    # final_date

  end

end
