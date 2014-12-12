class Game < ActiveRecord::Base
  has_many :object_cannon_games
  def players_name
    [first_player.name, second_player.name]
  end

  def first_player
    Player.find(self.first_player_id)
  end

  def second_player
    Player.find(self.second_player_id)
  end
end
