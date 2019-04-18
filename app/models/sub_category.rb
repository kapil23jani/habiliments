class SubCategory < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_one_attached :cover_pic, dependent: :destroy
  has_many :products, dependent: :destroy


  validates :sub_category_name, presence: true
end
