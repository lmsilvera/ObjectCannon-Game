class ObjectsController < ApplicationController
  def create
    @object = ObjectCannonGame.new
    @object.game_id = params[:game_id]
    @object.player_id = params[:player_id]
    @object.save
    respond_to { |format| format.js }
  end
end
