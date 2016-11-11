defmodule FeedApi.Router do
  use FeedApi.Web, :router

  pipeline :api do
    plug :accepts, ["json", "json-api"]
  end

  scope "/api", FeedApi do
    pipe_through :api

    # Registration
    post "register", RegistrationController, :create
    # Route stuff to our SessionController
    resources "session", SessionController, only: [:index]

    # Links
    get "/links/feed", LinkController, :feed
    resources "/links", LinkController do
    end

  end
end
