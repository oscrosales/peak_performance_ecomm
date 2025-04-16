class ProductsController < ApplicationController
  def index
    @products = Product.order("id ASC")
                       .page(params[:page])
                       .per(9)
  end

  def show
    @product = Product.includes(:brand)
                      .find(params[:id])
  end

  def search_results
    @query = params[:query]
    @category = params[:category]

    @products = Product.joins(brand: :category)
                       .where("products.name LIKE ? OR products.description LIKE ?", "%#{@query}%", "%#{@query}%")

    if @category.present?
      @products = @products.where("categories.id = ?", @category)
    end

    @products = @products.page(params[:page])
                         .per(9)
  end
end
