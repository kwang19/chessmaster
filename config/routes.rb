Rails.application.routes.draw do
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
  root "games#index"
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
  get "/add_like/:user_id/:game_id", :controller => "likes", :action => "add"
  # READ
  get "/likes", :controller => "likes", :action => "index"
  get "/likes/:id", :controller => "likes", :action => "show"

  # UPDATE
  get "/likes/:id/edit", :controller => "likes", :action => "edit"
  post "/update_like/:id", :controller => "likes", :action => "update"

  # DELETE
  get "/delete_like/:id", :controller => "likes", :action => "destroy"
  post "/delete_like", :controller => "likes", :action => "destroy"
  #------------------------------

  # Routes for the Game resource:
  # CREATE
  get "/games/new", :controller => "games", :action => "new"
  post "/create_game", :controller => "games", :action => "create"
  get "/newgame", :controller => "games", :action => "newgame"
  # READ
  get "/games", :controller => "games", :action => "index"
  get "/mywall", :controller => "games", :action => "mywall"
  get "/mylikes", :controller => "games", :action => "mylikes"

  get "/games/:id", :controller => "games", :action => "show"
  get "/games/user/:id", :controller => "games", :action => "showuser"
  # UPDATE
  get "/games/:id/edit", :controller => "games", :action => "edit"
  post "/update_game/:id", :controller => "games", :action => "update"
  get "/editgame", :controller => "games", :action => "editgame"
  # DELETE
  get "/delete_game/:id", :controller => "games", :action => "destroy"
  #------------------------------
  get "/users", :controller => "users", :action => "index"
  # get "/users/:id", :controller => "users", :action => "show"
  devise_for :users
  get '/chessboard', to: 'chessboard#chessboard'
  post "/showgame", :controller => "chessboard", :action => "showgame"
  post "/editgame", :controller => "chessboard", :action => "editgame"
  post "/savegame", :controller => "chessboard", :action => "savegame"
  post "/savenewgame", :controller => "chessboard", :action => "savenewgame"
  get "/showchess", :controller => "chessboard", :action => "show"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
