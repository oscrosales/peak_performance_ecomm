class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :initialize_session
  helper_method :cart
  helper_method :product_in_cart?

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def cart
    session[:cart].map do | product_id, quantity |
      product = Product.find_by(id: product_id)

      {
        product: product,
        quantity: quantity
      }
    end
  end

  def product_in_cart?(product)
    cart.any? { |item| item[:product].id == product.id }
  end
end
