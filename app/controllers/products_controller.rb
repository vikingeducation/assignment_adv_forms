class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(whitelisted_params)

    if @product.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(whitelisted_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  private

  def whitelisted_params
    params.require(:product).permit(:name, :description, :price, :category_ids)
  end
end
