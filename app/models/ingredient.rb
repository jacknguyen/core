class Ingredient < ActiveRecord::Base
  # this will allow drag-n-drop sorting functionality
  include RankedModel
  ranks :row_order, :with_same => :list_id

  belongs_to :list
  scope :master_list_ingredients, -> { where(list_id: 1) }

  validates :name, presence: true
  validates :step, presence: true
  validates :track, presence: true
end