class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def show
    @category = Category.includes(brands: :products).find(params[:id])
    @products = @category.brands.flat_map(&:products)
  end
end
