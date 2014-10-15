class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
    @quote = @movie.quotes.build()
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
    @quote = @movie.quotes.build()
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes(whitelisted_movie_params)
      redirect_to edit_movie_path(@movie)
    else
      render 'edit'
    end
  end

  private

  def whitelisted_movie_params
    params.require(:movie).permit(:title, {:actor_ids => []}, {:quotes_attributes => [:id, :text, :_destroy]})
  end
end
