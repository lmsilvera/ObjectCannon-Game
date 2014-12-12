class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :first_player_id
      t.integer :second_player_id
      t.integer :winner_wall_health_remaining
      t.string :winner

      t.timestamps
    end
  end
end
