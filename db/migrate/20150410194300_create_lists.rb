class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.belongs_to :product, index: true
      t.timestamps null: false
    end
  end
end
