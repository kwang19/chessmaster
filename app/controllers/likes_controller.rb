class LikesController < ApplicationController
  def index
    @likes = Like.all

    render("likes/index.html.erb")
  end

  def show
    @like = Like.find(params[:id])

    render("likes/show.html.erb")
  end
  def add
    @like = Like.new

    @like.user_id = params[:user_id]
    @like.game_id = params[:game_id]

    save_status = @like.save
    @game = Game.find(params[:game_id])
    @pgn = @game.pgn
    if save_status == true
      # redirect_to("/comments/#{@comment.id}", :notice => "Comment created successfully.")
      render("/chessboard/chessboard.html.erb")

    end


  end
  def new
    @like = Like.new

    render("likes/new.html.erb")
  end

  def create
    @like = Like.new

    @like.user_id = params[:user_id]
    @like.game_id = params[:game_id]
    @game = Game.find(@like.game_id)

    save_status = @like.save

    render("/chessboard/chessboard.html.erb")
  end

  def edit
    @like = Like.find(params[:id])

    render("likes/edit.html.erb")
  end

  def update
    @like = Like.find(params[:id])

    @like.user_id = params[:user_id]
    @like.game_id = params[:game_id]

    save_status = @like.save

    if save_status == true
      redirect_to("/likes/#{@like.id}", :notice => "Like updated successfully.")
    else
      render("likes/edit.html.erb")
    end
  end

  def destroy
    @like = Like.find(params[:like_id])
    @game = Game.find(params[:game_id])

    @like.destroy

    render("/chessboard/chessboard.html.erb")
  end
end
