defmodule FeedApi.Router do
  use FeedApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FeedApi do
    pipe_through :api

    get "/links/feed", LinkController, :feed
    resources "/links", LinkController do
    end

  end
end
