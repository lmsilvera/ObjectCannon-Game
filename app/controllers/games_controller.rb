class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show
    @game = Game.find(params[:id])
  end

  def end_game
    @game = Game.find(params[:id])
    total_first_player = @game.object_cannon_games.where(player_id: @game.first_player.id).map(&:total_attributes).reduce(:+) || 0
    total_second_player = @game.object_cannon_games.where(player_id: @game.second_player.id).map(&:total_attributes).reduce(:+) || 0
    if total_first_player > total_second_player
      @game.winner_wall_health_remaining = 100 - total_second_player
      @game.winner = "Player 1"
    else
      @game.winner_wall_health_remaining = 100 - total_first_player
      @game.winner = "Player 2"
    end
    if @game.save
      redirect_to games_path
    else
      redirect_to game_path @game
    end
  end

  def create
    @game = Game.new
    first_player = Player.create(name: get_params[:first_player_id])
    second_player = Player.create(name: get_params[:second_player_id])
    @game.first_player_id = first_player.id
    @game.second_player_id = second_player.id
    if @game.save
      redirect_to game_path @game
    else
      render :new
    end
  end
  private
    def get_params
      params.require(:game).permit(:first_player_id, :second_player_id)
    end
end
