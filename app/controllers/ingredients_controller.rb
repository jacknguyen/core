class IngredientsController < ApplicationController
  before_action :set_ingredient, only: [:edit, :update, :destroy]

  def new
    @ingredient = Ingredient.new
  end

  def index
    @ingredients = Ingredient.all.order(:created_at)
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    set_ingredient_to_default_list(@ingredient)

    if @ingredient.save
      redirect_to ingredients_url
    else
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

    # initially every ingredient added to system will belong to the first list
    # couldn't put it in ingredient model because when duplicating with amoeba
    # it set those ingredients to master list as well instead of the new list
    def set_ingredient_to_default_list(ingredient)
      ingredient.list_id = List.find_by(name: 'master').id
    end
end
