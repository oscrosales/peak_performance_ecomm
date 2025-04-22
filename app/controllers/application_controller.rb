class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  before_action :initialize_session
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :cart
  helper_method :categories
  helper_method :product_in_cart?

  protected

  def configure_permitted_parameters
    added_attrs = [ :name, :username, :address, :city, :province_id, :postal_code, :phone, :email, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    devise_parameter_sanitizer.permit(:account_update, keys: added_attrs)
  end

  private

  def initialize_session
    session[:cart] ||= {}
  end

  def cart
    session[:cart].map do | product_id, quantity |
      product = Product.find_by(id: product_id)

      {
        product: product,
        quantity: quantity,
        total: product.price * quantity
      }
    end
  end

  def categories
    Category.all()
  end

  def product_in_cart?(product)
    cart.any? { |item| item[:product].id == product.id }
  end
end
