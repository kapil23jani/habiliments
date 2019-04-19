class Cart < ApplicationRecord
  belongs_to :product
  has_many :products
end
