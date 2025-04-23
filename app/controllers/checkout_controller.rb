class CheckoutController < ApplicationController
  def shipping
  end

  def invoice
    session[:province_id] = params[:province_id]
  end

  def create
    subtotal = 0

    line_items = session[:cart].map do | product_id, quantity |
      product = Product.find(product_id)
      total_price = product.price * quantity.to_i
      subtotal += total_price
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

    province = Province.find_by(id: session[:province_id])

    if province.hst.present? && province.hst > 0
      hst = province.hst * subtotal
      tax_total = hst
      tax_name = "HST"
    else
      gst = province.gst * subtotal
      pst = province.pst * subtotal
      tax_total = gst + pst
      tax_name = "GST + PST"
    end

    line_items << {
      price_data: {
        currency: "cad",
        product_data: {
          name: tax_name
        },
        unit_amount: (tax_total * 100).round  # Ensures no float weirdness
      },
      quantity: 1
    }

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
