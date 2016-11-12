defmodule FeedApi.AuthErrorHandler do
 use FeedApi.Web, :controller

 def unauthenticated(conn, params) do
  conn
   |> put_status(401)
   |> render(FeedApi.ErrorView, "401.json")
 end

 def unauthorized(conn, params) do
  conn
   |> put_status(403)
   |> render(FeedApi.ErrorView, "403.json")
 end
end
