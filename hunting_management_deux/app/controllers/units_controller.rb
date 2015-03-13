class UnitsController < ApplicationController
  def index
    @units= Unit.all
  end
  
  def new
    @unit = Unit.new
    3.times do
      @unit.hunters.build
    end
    @hunters = Hunter.all
  end
  
  def show
    @unit = Unit.find(params[:id])
  end

  def edit
    @unit = Unit.find(params[:id])
  end

  def update
    @unit = Unit.new(whitelisted_params)
    params["unit"]["hunter_ids"].each do |hunter_id|
      @unit.hunters << Hunter.find(hunter_id) unless hunter_id == ""
    end
    if @unit.save
      redirect_to @unit
    else
      render 'edit'
    end
  end
  def create
    if params["unit"]["hunters_attributes"]["0"]
      @unit = Unit.new(whitelisted_params)
    else
      @unit = Unit.new(whitelisted_params)
      params["unit"]["hunter_ids"].each do |hunter_id|
        @unit.hunters << Hunter.find(hunter_id) unless hunter_id == ""
      end
    end
    if @unit.save
      redirect_to @unit
    else
      render 'new'
    end
  end

  def destroy
    @unit = Unit.find(params[:id])
    @unit.destroy

    redirect_to units_path
  end

  private
    def whitelisted_params
      params.require(:unit).
      permit(:id,
             :name,
             :town,
             :hunter_ids,
             { :hunters_attributes => [
                  :name,
                  :town,
                  :hunter_id ] } )
    end  
end

