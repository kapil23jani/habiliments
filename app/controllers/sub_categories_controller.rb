class SubCategoriesController < ApplicationController

  def index
    @sub_categories = current_user.sub_categories.all
  end

  def new
    @category = Category.find_by_id(params[:category_id])
    @sub_category = @category.sub_categories.new
  end

  def create
    @category = Category.find_by_id(params[:category_id])
    @sub_category = @category.sub_categories.create(sub_category_params)
    if @sub_category.save
      redirect_to user_category_path(current_user, @category)
    else
      render 'new'
    end
  end

  def show
    @sub_category = SubCategory.find_by_id(params[:id])
    @products = @sub_category.products.all
  end

  def edit
    @sub_category = SubCategory.find_by_id(params[:id])
  end

  def update
    @sub_category = SubCategory.find_by_id(params[:id])
    binding.pry
    if @sub_category.update(sub_category_params)
      redirect_to user_category_path(current_user, @sub_category.category_id)
    else
      render 'edit'
    end
  end

  def destory
    @sub_category = SubCategory.find_by_id(params[:id])
  end


  private

  def find_sub_category
    @sub_category = Subcategory.find_by_id(:params[:id])
  end

  def sub_category_params
    params.require(:sub_category).permit(:user_id, :sub_category_name, :cover_pic)
  end

end
