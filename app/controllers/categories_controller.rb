class CategoriesController < ApplicationController
  def create
    category = current_user.categories.new(category_params)
    if category.save
      redirect_to request.referer
    else
      render "users/show"
    end
  end

  def destroy
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
