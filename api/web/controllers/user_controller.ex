defmodule FeedApi.UserController do
  use FeedApi.Web, :controller

  alias FeedApi.User
  plug Guardian.Plug.EnsureAuthenticated, handler: FeedApi.AuthErrorHandler

  def current(conn, _) do
    user = conn
    |> Guardian.Plug.current_resource

    conn
    |> render(FeedApi.UserView, "show.json", user: user)
  end
end
