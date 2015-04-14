class Ingredient < ActiveRecord::Base
  belongs_to :list

  validates :name, presence: true
  validates :step, presence: true
  validates :track, presence: true
end