class Ingredient < ActiveRecord::Base
  validates :name, presence: true
  validates :step, presence: true
  validates :track, presence: true
end