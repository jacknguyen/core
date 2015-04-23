class Ingredient < ActiveRecord::Base
  # this will allow drag-n-drop sorting functionality
  include RankedModel
  ranks :row_order

  belongs_to :list

  validates :name, presence: true
  validates :step, presence: true
  validates :track, presence: true
end