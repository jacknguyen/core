class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update, :destroy]
  before_action :set_product_ingredients, only: [:edit, :update]

  def index
    @products = Product.sorted
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_url
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to products_url
    else
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url
  end

  private
    def product_params
      params.require(:product).permit(:name, :description)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def set_product_ingredients
      @ingredients = Product.find(params[:id]).ingredients.rank(:row_order).all
    end
end
