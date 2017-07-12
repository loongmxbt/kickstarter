defmodule Kickstarter.Web.Router do
  use Kickstarter.Web, :router
  use ExAdmin.Router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true 
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  # Coherence
  scope "/" do
    pipe_through :browser
    coherence_routes()
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  # Site Public
  scope "/", Kickstarter.Web do
    pipe_through :browser

    get "/", PageController, :index
    get "/course", PageController, :course
    get "/showcase", PageController, :showcase
    get "/tutor", PageController, :tutor
    get "/train", PageController, :train
  end

  # Site Protected
  scope "/", Kickstarter.Web do
    pipe_through :protected

    get "/join", PageController, :join
    get "/proj", PageController, :proj
  end

  # ExAdmin
  scope "/admin", ExAdmin do
    pipe_through :browser
    admin_routes()
  end

  # Other scopes may use custom stacks.
  # scope "/api", Kickstarter.Web do
  #   pipe_through :api
  # end
end
