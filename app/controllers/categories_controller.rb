class CategoriesController < ApplicationController
    

    def index
      @categories = Category.all
    end

    def new
      @category = Category.new
    end

    def create
      @category = current_user.categories.create(category_params)
      if @category.save
          redirect_to user_categories_path(current_user)
      else
          render "new"
      end
    end

    private
    def category_params
      params.require(:category).permit(:name, :category_pic)
    end
end
