class PoliticiansController < ApplicationController
  def index
    @politicians = Politician.all
  end
  def show
    @politician = Politician.find(params[:id])
  end
  def new
    @politician = Politician.new
  end

  def create
    @politician = Politician.new(pol_params)
    if @politician.save
      flash[:success] = "New Politician \"#{@politician.name}\" has been successfully created!"
      redirect_to @politician
    else
      flash[:error] = "Politician was not created, please try again"
      render 'new'
    end
  end

  def edit
    @politician =Politician.find(params[:id])
  end

  def update
    @politician = Politician.find(params[:id])
    if @politician.update(pol_params)
      flash[:success] = "Politician \"#{@politician.name}\" has been successfully updated!"
      redirect_to @politician
    else
      flash.now[:error] = "User did not update, please try again"
      render 'edit' 
    end
  end

  private

  def pol_params
    params.
    require(:politician).
    permit(:name,
           :party,
           :slogan_ids => [],
           :slogans_attributes => [
           :name,
           :id,
           :_destroy])
  end
end
