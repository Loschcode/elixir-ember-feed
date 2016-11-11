defmodule FeedApi.RegistrationController do
  use FeedApi.Web, :controller

  def create(conn, %{"data" => %{"type" => "user",
  	"attributes" => %{"email" => email,
  	  "password" => password,
  	  "password_confirmation" => password_confirmation}}}) do
  	# Return some static JSON for now
    conn
    |> json(%{status: "Ok"})
  end
end
