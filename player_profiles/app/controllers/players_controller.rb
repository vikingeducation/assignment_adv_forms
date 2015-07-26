class PlayersController < ApplicationController

  def new
    @player = Player.new
  end


  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to :root
    else
      render :new
    end
  end


  def edit
    @player = Player.find(params[:id])
  end


  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to :root
    else
      render :edit
    end
  end



  private

  def player_params
    params.require(:player).permit(:name, :achievement_ids => [])
  end

end
