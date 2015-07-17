class AuthorsController < ApplicationController

	def index
		@authors = Author.all
	end

	def edit
		@author = Author.find(params[:id])
	end

	def show
		@author = Author.find(params[:id])
	end
	
	def new
		@author = Author.new
	end

	def create
    @author = Author.new(whitelisted_author_params)
    if @author.save
      flash[:success] = "Created new author!"
      redirect_to @author
    else
      flash.now[:error] = "Failed to Create Author!"
      render :new
    end
  end

  def update
  	@author = Author.find(params[:id])
  	if @author.update(whitelisted_author_params)
  		flash[:success] = "Edited author successfully!"
      redirect_to @author
    else
      flash.now[:error] = "Failed to Edit Author!"
      render :edit
    end
  end

private
	def whitelisted_author_params
		params.
      require(:author).
      permit( :first_name,
      				:last_name,
              :email,
              { :books_attributes => [
                  :id,
                  :_destroy,
                  :title,
                  :description] } )
	end

end
