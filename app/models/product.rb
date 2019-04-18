class Product < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :sub_category
  has_one_attached :product_cover_pic, dependent: :destroy
  has_many_attached :pictures , dependent: :destroy

  validates :product_name, :brand_name, :product_cover_pic, presence: true
end
