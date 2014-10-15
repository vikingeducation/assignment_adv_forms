class MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(whitelisted_movie_params)
    if @movie.save
      redirect_to new_movie_path
    else
      render 'new'
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(whitelisted_movie_params)
      redirect_to new_movie_path
    else
      render 'edit'
    end
  end

  private

  def whitelisted_movie_params
    params.require(:movie).permit(:title, :actor_ids => [])
  end
end
