class CreateObjectCannonGames < ActiveRecord::Migration
  def change
    create_table :object_cannon_games do |t|
      t.integer :total_attributes
      t.integer :player_id
      t.integer :game_id

      t.timestamps
    end
  end
end
