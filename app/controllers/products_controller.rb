class ProductsController < ApplicationController



  def new
    @category = Category.find_by_id(params[:category_id])
    @sub_category = SubCategory.find_by_id(params[:sub_category_id])
    @product = @sub_category.products.new
  end

  def create
    @category = Category.find_by_id(params[:category_id])
    @sub_category = SubCategory.find_by_id(params[:sub_category_id])
    @product = @sub_category.products.create(product_params)
    if @product.save
      redirect_to user_category_sub_category_path(current_user, @category, @sub_category)
    else
      render 'new'
    end
  end

  def show
    @product = Product.find_by_id(params[:id])
  end

  def edit
    @category = Category.find_by_id(params[:category_id])
    @sub_category = SubCategory.find_by_id(params[:sub_category_id])
    @product = Product.find_by_id(params[:id])
  end

  def update
    binding.pry
    @product = Product.find_by_id(params[:id])
  end



  private

  def product_params
    params.require(:product).permit(:product_name, :brand_name, :material, :description, :colour, :price, :user_id, :category_id, :product_cover_pic, pictures: [])
  end

end
