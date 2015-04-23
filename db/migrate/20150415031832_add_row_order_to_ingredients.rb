class AddRowOrderToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :row_order, :integer
  end
end
