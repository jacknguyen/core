class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]
  before_action :set_product_ingredients, only: [:edit, :update]

  def index
    @products = Product.all.order(:created_at)
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
    # @ingredients = Product.find(params[:id]).ingredients
  end

  def update
    if @product.update_attributes(product_params)
      redirect_to products_url
    else
      render 'edit'
    end
  end

  private
    def product_params
      params.require(:product).permit(:name, :description)
    end

    def set_product
      @product = Product.find(params[:id])
    end

    def set_product_ingredients
      @ingredients = Product.find(params[:id]).ingredients
    end
end
