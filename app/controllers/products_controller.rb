class ProductsController < ApplicationController
  def index
    @products = Product.order("id ASC")
                       .page(params[:page])
                       .per(12)
  end

  def show
    @product = Product.includes(:brand)
                      .find(params[:id])
  end
end
