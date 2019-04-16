class Category < ApplicationRecord
  belongs_to :user
  has_one_attached :category_pic 
end
