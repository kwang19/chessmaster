
class ChessboardController < ApplicationController
	skip_before_filter :verify_authenticity_token
	def chessboard
		@game = Game.find(params[:game_id])
		@pgn = @game.pgn
	end
	def showgame
		@game = Game.find(params[:game_id])
		@pgn = @game.pgn
		render("/chessboard/chessboard.html.erb")
	end
	def editgame
		@game = Game.find(params[:game_id])
		render("chessboard/editgame.html.erb")
	end
	def savegame
		@game = Game.find(params[:game_id])
		@game.pgn = params[:pgn]
		@game.eventname = params[:eventname]
		@game.user_id = params[:user_id]
		@game.eventdate = params[:eventdate]
		@game.white = params[:white]
		@game.black = params[:black]
		@game.result = params[:result]
		@game.save
		render("chessboard/chessboard.html.erb")
	end
	def newgame
		@game = Game.find(params[:game_id])
		@game.pgn = params[:pgn]
		@game.eventname = params[:eventname]
		@game.user_id = params[:user_id]
		@game.eventdate = params[:eventdate]
		@game.white = params[:white]
		@game.black = params[:black]
		@game.result = params[:result]
		@game.save
		@games= current_user.games.paginate(:page => params[:page], :per_page => 5)

		render("games/my_game.html.erb")

	end
end
