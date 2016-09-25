defmodule FeedApi.Router do
  use FeedApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FeedApi do
    pipe_through :api

    resources "/links", LinkController
  end
end
