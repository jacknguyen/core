class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  validates :step, presence: true
end
