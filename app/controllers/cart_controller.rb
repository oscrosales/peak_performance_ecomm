class CartController < ApplicationController
  before_action :get_product, only: [ :create, :destroy ]

  def index
  end

  def create
    quantity = params[:quantity].to_i
    quantity = 1 if quantity < 1

    session[:cart][@product.id] = quantity
    flash[:notice] = "#{@product.name} was added to the cart"

    redirect_to root_path
  end

  def destroy
    if session[:cart].include?(@product.id)
      session[:cart].delete(@product.id)
      flash[:notice] = "#{@product.name} (x#{quantity}) was removed from the cart"
    end

    redirect_to root_path
  end

  private

  def get_product
    product_id = params[:id].to_i
    @product = Product.find(product_id)
  end
end
