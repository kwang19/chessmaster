class GamesController < ApplicationController
  before_action :current_user_must_be_game_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_game_user
    game = Game.find(params[:id])

    unless current_user == game.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Game.ransack(params[:q])
    @games = @q.result(:distinct => true).includes(:comments, :gameratings, :likes, :user, :fans, :commenters).page(params[:page]).per(10)

    render("games/index.html.erb")
  end

  def show
    @like = Like.new
    @gamerating = Gamerating.new
    @comment = Comment.new
    @game = Game.find(params[:id])

    render("games/show.html.erb")
  end

  def new
    @game = Game.new

    render("games/new.html.erb")
  end

  def create
    @game = Game.new

    @game.pgn = params[:pgn]
    @game.user_id = params[:user_id]
    @game.eventname = params[:eventname]
    @game.eventdate = params[:eventdate]
    @game.white = params[:white]
    @game.black = params[:black]
    @game.result = params[:result]

    save_status = @game.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/games/new", "/create_game"
        redirect_to("/games")
      else
        redirect_back(:fallback_location => "/", :notice => "Game created successfully.")
      end
    else
      render("games/new.html.erb")
    end
  end

  def edit
    @game = Game.find(params[:id])

    render("games/edit.html.erb")
  end

  def update
    @game = Game.find(params[:id])

    @game.pgn = params[:pgn]
    @game.user_id = params[:user_id]
    @game.eventname = params[:eventname]
    @game.eventdate = params[:eventdate]
    @game.white = params[:white]
    @game.black = params[:black]
    @game.result = params[:result]

    save_status = @game.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/games/#{@game.id}/edit", "/update_game"
        redirect_to("/games/#{@game.id}", :notice => "Game updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Game updated successfully.")
      end
    else
      render("games/edit.html.erb")
    end
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy

    if URI(request.referer).path == "/games/#{@game.id}"
      redirect_to("/", :notice => "Game deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Game deleted.")
    end
  end
end
