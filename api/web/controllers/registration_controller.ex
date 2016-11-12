defmodule FeedApi.RegistrationController do
  use FeedApi.Web, :controller
  alias FeedApi.User


# curl -XPOST -H "Content-type: application/json" -d '{"data": {"type": "user", "attributes": {"email": "mike@example.com", "password": "abcde12345", "password_confirmation": "abcde12345"}}}' 'http://localhost:4000/api/register'

  def create(conn, %{"data" => %{
      "type" => "users",
      "attributes" => %{"email" => email, "password" => password, "password-confirmation" => password_confirmation}}}) do

    changeset = User.changeset %User{}, %{email: email,
      password_confirmation: password_confirmation,
      password: password}

    case Repo.insert changeset do
      {:ok, user} ->
        conn
        |> put_status(:created)
        |> render(FeedApi.UserView, "show.json", user: user)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(FeedApi.ChangesetView, "error.json", changeset: changeset)
    end

  end

end
