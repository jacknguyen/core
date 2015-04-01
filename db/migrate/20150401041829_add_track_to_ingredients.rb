class AddTrackToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :track, :string
  end
end
