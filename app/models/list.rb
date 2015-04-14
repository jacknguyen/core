class List < ActiveRecord::Base
  belongs_to :product

  has_many :ingredients

  amoeba do
    enable
    clone [:ingredients]
    append name: " copy"
  end
end