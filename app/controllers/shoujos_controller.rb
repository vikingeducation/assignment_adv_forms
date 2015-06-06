class ShoujosController < ApplicationController
  def index
    @shoujos = Shoujo.all
  end

  def new
    @shoujo = Shoujo.new
    @anime = @shoujo.animes.build
  end

  def show
    @shoujo = Shoujo.find(params[:id])
  end

  def edit
    @shoujo = Shoujo.find(params[:id])
    @anime = @shoujo.animes.build
  end

  def create
    @shoujo = Shoujo.new(whitelisted_shoujo_params)
    if @shoujo.save
      redirect_to shoujos_path
    else
      render "/shoujos/new"
    end
  end

  def update
  @shoujo = Shoujo.find(params[:id])
  if @shoujo.update(whitelisted_shoujo_params)
    redirect_to shoujos_path
  else
    render "/shoujos/edit"
  end
end

  def whitelisted_shoujo_params
    params.require(:shoujo).permit(:name, :anime, archetype_ids: [], animes_attributes: [:id, :title, :season_number, :year, :_destroy] )
  end
end
