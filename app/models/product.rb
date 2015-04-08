class Product < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 255,
                               message: "Please enter a shorter product name" }
end