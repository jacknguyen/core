class AddListRefToIngredients < ActiveRecord::Migration
  def change
    add_reference :ingredients, :list, index: true
  end
end
