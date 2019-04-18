class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :trackable

  has_one :sellerprofile, dependent: :destroy
  has_many :categories, dependent: :delete_all
  accepts_nested_attributes_for :sellerprofile
  has_many :addresses, dependent: :delete_all
  has_many :sub_categories, dependent: :delete_all

  protected
  def password_required?
    confirmed? ? super : false
  end
end
