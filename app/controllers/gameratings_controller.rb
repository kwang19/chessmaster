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
    @gamerating.value = params[:value]
    @gamerating.game_id = params[:game_id]

    save_status = @gamerating.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gameratings/new", "/create_gamerating"
        redirect_to("/gameratings")
      else
        redirect_back(:fallback_location => "/", :notice => "Gamerating created successfully.")
      end
    else
      render("gameratings/new.html.erb")
    end
  end

  def edit
    @gamerating = Gamerating.find(params[:id])

    render("gameratings/edit.html.erb")
  end

  def update
    @gamerating = Gamerating.find(params[:id])
    @gamerating.value = params[:value]
    @gamerating.game_id = params[:game_id]

    save_status = @gamerating.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/gameratings/#{@gamerating.id}/edit", "/update_gamerating"
        redirect_to("/gameratings/#{@gamerating.id}", :notice => "Gamerating updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Gamerating updated successfully.")
      end
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
      redirect_back(:fallback_location => "/", :notice => "Gamerating deleted.")
    end
  end
end
