class HuntersController < ApplicationController
  def index
    @hunters= Hunter.all
  end
  
  def new
    @hunter = Hunter.new
    3.times do
      @hunter.units.build
    end
    @units = Unit.all
  end
  
  def show
    @hunter = Hunter.find(params[:id])
  end

  def edit
    @hunter = Hunter.find(params[:id])
  end

  def update
    @hunter = Hunter.new(whitelisted_params)
    params["hunter"]["unit_ids"].each do |unit_id|
      @hunter.units << Unit.find(unit_id) unless unit_id == ""
    end
    if @hunter.save
      redirect_to @hunter
    else
      render 'edit'
    end
  end

  def create
    if params["hunter"]["units_attributes"]["0"]
      @hunter = Hunter.new(whitelisted_params)
    else
      @hunter = Hunter.new(whitelisted_params)
      params["hunter"]["unit_ids"].each do |unit_id|
        @hunter.units << Unit.find(unit_id) unless unit_id == ""
      end
    end
    if @hunter.save
      redirect_to @hunter
    else
      render 'new'
    end
  end

  def destroy
    @hunter = Hunter.find(params[:id])
    @hunter.destroy

    redirect_to hunters_path
  end

  private
    def whitelisted_params
      params.require(:hunter).
      permit(:id,
             :name,
             :town,
             :unit_ids,
             { :units_attributes => [
                  :name,
                  :unit_id ] } )
    end  
end
