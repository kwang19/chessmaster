class GameratingsController < ApplicationController
  def index
    @gameratings = Gamerating.all

    render("gameratings/index.html.erb")
  end

  def show
    @gamerating = Gamerating.find(params[:id])

    render("gameratings/show.html.erb")
  end

  def new
    @gamerating = Gamerating.new

    render("gameratings/new.html.erb")
  end

  def create
    @gamerating = Gamerating.new

    @gamerating.user_id = params[:user_id]
    @gamerating.game_id = params[:game_id]
    @gamerating.value = params[:value]

    save_status = @gamerating.save
    @game = Game.find(@gamerating.game_id)

    render("/chessboard/chessboard.html.erb")
  end

  def edit
    @gamerating = Gamerating.find(params[:id])

    render("gameratings/edit.html.erb")
  end

  def update
    @gamerating = Gamerating.find(params[:id])

    @gamerating.user_id = params[:user_id]
    @gamerating.game_id = params[:game_id]
    @gamerating.value = params[:value]

    save_status = @gamerating.save

    if save_status == true
      redirect_to("/gameratings/#{@gamerating.id}", :notice => "Gamerating updated successfully.")
    else
      render("gameratings/edit.html.erb")
    end
  end

  def destroy
    @gamerating = Gamerating.find(params[:id])

    @gamerating.destroy

    if URI(request.referer).path == "/gameratings/#{@gamerating.id}"
      redirect_to("/", :notice => "Gamerating deleted.")
    else
      redirect_to(:back, :notice => "Gamerating deleted.")
    end
  end
end
