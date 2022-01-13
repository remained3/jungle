class CategoriesController < ApplicationController

  def show
    @category = Category.find(params[:id])
    @categories = @category.products.order(created_at: :desc)
  end

end
