class List < ActiveRecord::Base
  belongs_to :product
  has_many :ingredients, dependent: :destroy
  scope :master_list, -> { where(name: 'master') }

  amoeba do
    enable
    clone [:ingredients]
    append name: " copy"
  end
end