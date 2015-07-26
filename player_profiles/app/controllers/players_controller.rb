class PlayersController < ApplicationController

  def new
    @player = Player.new
    @player.scores.build
  end


  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to edit_player_path(@player.id)
    else
      render :new
    end
  end


  def edit
    @player = Player.find(params[:id])
    @player.scores.build
  end


  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to edit_player_path(@player.id)
    else
      render :edit
    end
  end



  private

  def player_params
    params.require(:player).
    permit(
            :name,
            { :achievement_ids => [], :scores_attributes => [:id, :game_type, :score, :_destroy] }
          )
  end

end
