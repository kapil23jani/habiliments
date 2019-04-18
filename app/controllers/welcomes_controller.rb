class WelcomesController < ApplicationController
  def index
  	@categories = Category.all
  end


  def seller
  	@sellers = User.all.where(role: "Seller")
  end

  def customer
  	@customers = User.all.where(role: "Customer")
  end
end
