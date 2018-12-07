defmodule AdaAdaWeb.Router do
  use AdaAdaWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AdaAdaWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/signin", RegistrationController, :signin
    get "/login", RegistrationController, :login
    get "/users", UserController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AdaAdaWeb do
  #   pipe_through :api
  # end
end
