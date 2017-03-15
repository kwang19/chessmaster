class GamesController < ApplicationController
  def index
    # @games = Game.all
    @games = Game.order("created_at").paginate(:page => params[:page], :per_page => 5)

    render("games/index.html.erb")
  end
  def mylikes
    @games = current_user.liked_games.paginate(:page => params[:page], :per_page => 5)
    render("games/my_like.html.erb")
  end
  def mywall
    @user = User.find(current_user.id)
    @games= Game.order("created_at").paginate(:page => params[:page], :per_page => 5)

    render("games/index.html.erb")
  end
  def show
    @game = Game.find(params[:id])

    render("games/show.html.erb")
  end
  def showuser
    @user = User.find(params[:id])
    @games = @user.games.paginate(:page => params[:page], :per_page => 5)

    render("games/index.html.erb")
  end
  def new
    @game = Game.new
    render("games/new.html.erb")
  end
  def newgame
    @game = Game.new
    render("chessboard/newgame.html.erb")
  end
  def editgame
    @game = Game.find(params[:game_id])
    render("chessboard/editgame.html.erb")
  end
  def create
    @game = Game.new

    @game.pgn = params[:pgn]
    @game.eventname = params[:eventname]
    @game.user_id = params[:user_id]
    @game.eventdate = params[:eventdate]
    @game.white = params[:white]
    @game.black = params[:black]
    @game.result = params[:result]

    save_status = @game.save
    if save_status == true
      @games= current_user.games.paginate(:page => params[:page], :per_page => 5)
  redirect_to("/mywall")
else
  render("chessboard/newgame.html.erb")
end




  end

  def edit
    @game = Game.find(params[:id])

    render("games/edit.html.erb")
  end

  def update
    @game = Game.find(params[:id])

    @game.pgn = params[:pgn]
    @game.eventname = params[:eventname]
    @game.user_id = params[:user_id]
    @game.eventdate = params[:eventdate]
    @game.white = params[:white]
    @game.black = params[:black]
    @game.result = params[:result]

    save_status = @game.save

    if save_status == true
      redirect_to("/games/#{@game.id}", :notice => "Game updated successfully.")
    else
      render("games/edit.html.erb")
    end
  end

  def destroy
    @game = Game.find(params[:id])

    @game.destroy
    @games= current_user.games.paginate(:page => params[:page], :per_page => 5)

    redirect_to("/mywall")
  end
end
