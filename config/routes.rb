Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "games#index"
  # Routes for the Gamerating resource:
  # CREATE
  get "/gameratings/new", :controller => "gameratings", :action => "new"
  post "/create_gamerating", :controller => "gameratings", :action => "create"

  # READ
  get "/gameratings", :controller => "gameratings", :action => "index"
  get "/gameratings/:id", :controller => "gameratings", :action => "show"

  # UPDATE
  get "/gameratings/:id/edit", :controller => "gameratings", :action => "edit"
  post "/update_gamerating/:id", :controller => "gameratings", :action => "update"

  # DELETE
  get "/delete_gamerating/:id", :controller => "gameratings", :action => "destroy"
  #------------------------------

  # Routes for the Comment resource:
  # CREATE
  get "/comments/new", :controller => "comments", :action => "new"
  post "/create_comment", :controller => "comments", :action => "create"

  # READ
  get "/comments", :controller => "comments", :action => "index"
  get "/comments/:id", :controller => "comments", :action => "show"

  # UPDATE
  get "/comments/:id/edit", :controller => "comments", :action => "edit"
  post "/update_comment/:id", :controller => "comments", :action => "update"

  # DELETE
  get "/delete_comment/:id", :controller => "comments", :action => "destroy"
  #------------------------------

  # Routes for the Like resource:
  # CREATE
  get "/likes/new", :controller => "likes", :action => "new"
  post "/create_like", :controller => "likes", :action => "create"

  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Game resource:
  # CREATE
  get "/games/new", :controller => "games", :action => "new"
  post "/create_game", :controller => "games", :action => "create"

  # READ
  get "/games", :controller => "games", :action => "index"
  get "/games/:id", :controller => "games", :action => "show"

  # UPDATE
  get "/games/:id/edit", :controller => "games", :action => "edit"
  post "/update_game/:id", :controller => "games", :action => "update"

  # DELETE
  get "/delete_game/:id", :controller => "games", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
