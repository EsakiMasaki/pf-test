class CategoriesController < ApplicationController
  def create
    category = current_user.categories.new(category_params)
    category.save
    redirect_to request.referer
  end

  def destroy
    category = current_user.categories.find(params[:id])
    category.destroy
    redirect_to request.referer
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
