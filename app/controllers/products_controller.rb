class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.includes(:brand)
                      .find_by("id = ?", params[:id])
  end
end
