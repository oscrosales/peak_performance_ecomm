class CheckoutController < ApplicationController
  def shipping
  end

  def invoice
  end

  def create
    line_items = session[:cart].map do | product_id, quantity |
      product = Product.find(product_id)
      {
        price_data: {
          currency: "cad",
          product_data: {
            name: product.name,
            description: product.description
          },
          unit_amount: (product.price * 100).to_i
        },
        quantity: quantity
      }
    end

    session = Stripe::Checkout::Session.create(
      payment_method_types: [ "card" ],
      success_url: checkout_success_url,
      cancel_url: checkout_cancel_url,
      mode: "payment",
      line_items: line_items,
    )

    redirect_to session.url, allow_other_host: true
  end

  def success
    session[:cart] = {}
  end

  def cancel
  end
end
