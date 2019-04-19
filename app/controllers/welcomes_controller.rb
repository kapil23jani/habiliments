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

  def category_sub_category
  	@category = Category.find_by_id(params[:category_id])
  	@sub_category = @category.sub_categories
  end

  def products
  	@sub_category = SubCategory.find_by_id(params[:sub_category_id])
  	@products = @sub_category.products
  end

  def description_products
  	@product = Product.find_by_id(params[:product_id])
  	@cart =  Cart.new
  end

end
