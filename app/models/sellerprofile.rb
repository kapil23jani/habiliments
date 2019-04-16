class Sellerprofile < ApplicationRecord
  belongs_to :user

  validates :name, :trade_licence, :gst_no, :sales_tax, presence: true
end
