class List < ActiveRecord::Base
  belongs_to :product
  has_many :ingredients, dependent: :destroy

  amoeba do
    enable
    clone [:ingredients]
    append name: " copy"
  end
end