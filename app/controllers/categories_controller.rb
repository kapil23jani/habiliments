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

    def show
      @category = Category.find_by_id(params[:id])
      @sub_categories = @category.sub_categories.all
    end

    def edit
      @category = Category.find_by_id(params[:id])
    end

    def update
      @category = Category.find_by_id(params[:id])
      if @category.update(category_params)
        redirect_to user_list_path(current_user)
      else
        render 'edit'
      end
    end

    def destroy
      @category = Category.find_by_id(params[:id])
      if @category.destroy
        redirect_to user_list_path(current_user)
      end

    end

    def list
      @categories = current_user.categories
    end
            
    private
    def category_params
      params.require(:category).permit(:name, :category_pic)
    end
end
