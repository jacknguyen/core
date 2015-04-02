class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update, :destroy]

  def new
    @ingredient = Ingredient.new
  end

  def index
    @ingredients = Ingredient.all
  end

  def create
    ingredient = Ingredient.new(ingredient_params)

    if ingredient.save
      redirect_to ingredients_url
    else
      @ingredient = ingredient
      render 'new'
    end
  end

  def edit
  end

  def update
    if @ingredient.update_attributes(ingredient_params)
      redirect_to ingredients_url
    else
      render 'edit'
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_url
  end

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :step, :track)
    end

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
    end
end
