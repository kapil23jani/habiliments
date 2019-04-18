class Category < ApplicationRecord
  belongs_to :user
  has_one_attached :category_pic, dependent: :destroy
  has_many :sub_categories, dependent: :destroy
end
