class Product < ActiveRecord::Base
  has_one :list
  has_many :ingredients, through: :list
  after_create :make_copy_of_master_list
  scope :sorted, -> { order(:created_at) }

  validates :name, presence: true, length: { maximum: 255,
                               message: "Please enter a shorter product name" }

  # duplicates the master list upon creation of a product
  amoeba do
    enable
  end

  def set_copy_of_list_to_new_product(list)
    list.product_id = self.id
  end

  def make_copy_of_master_list
    master = List.find_by(name: 'master')
    copied_list = master.amoeba_dup
    set_copy_of_list_to_new_product(copied_list)
    copied_list.save
  end
end