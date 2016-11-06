defmodule FeedApi.Utils.Feeder do

  @doc """
  We try to get the tweets from the timeline of the user
  It will fetch all the needed datas and return them into an array
  """
  def feed! do
    from_twitter!
  end

  def from_twitter! do

    tweets = FeedApi.Scrappers.Twitter.dispatch!

    for tweet <- tweets do

      if FeedApi.Repo.get_by(FeedApi.Link, title: tweet.message) == nil do

        # let's insert this entry
        FeedApi.Repo.insert! %FeedApi.Link{
          title: tweet.message,
          description: nil,
          url: tweet.link,
          source: "twitter",
          published_at: tweet.date
        }

      else
        # the entry is already in the database
      end
    end

    #
  end


end
