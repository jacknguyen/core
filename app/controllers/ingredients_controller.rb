class IngredientsController < ApplicationController
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

  private
    def ingredient_params
      params.require(:ingredient).permit(:name, :step)
    end
end
