class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)

    if product.save
      redirect_to products_url
    else
      @product = product
      render 'new'
    end
  end

  def edit
  end

  private
    def product_params
      params.require(:product).permit(:name, :description)
    end
end
