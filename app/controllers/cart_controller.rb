class CartController < ApplicationController
  before_action :get_product, only: [ :create, :destroy ]

  def index
  end

  def create
    quantity = params[:quantity].to_i
    quantity = 1 if quantity < 1

    session[:cart][@product.id] = quantity
    flash[:notice] = "#{@product.name} (x#{quantity}) was added to the cart"

    redirect_to root_path
  end

  def update_quantity
    product_id = params[:id].to_s
    new_quantity = params[:quantity].to_i

    if session[:cart].key?(product_id)
      if new_quantity > 0
        session[:cart][product_id] = new_quantity
        flash[:notice] = "Quantity updated for #{Product.find(product_id).name}"
      else
        session[:cart].delete(product_id)
        flash[:alert] = "Item removed because quantity was set to 0"
      end
    end

    redirect_to cart_index_path
  end

  def destroy
    product_id = @product.id.to_s

    if session[:cart].key?(product_id)
      session[:cart].delete(product_id)
      flash[:notice] = "#{@product.name} was removed from the cart"
    end

    redirect_to cart_index_path
  end

  private

  def get_product
    product_id = params[:id].to_i
    @product = Product.find(product_id)
  end
end
