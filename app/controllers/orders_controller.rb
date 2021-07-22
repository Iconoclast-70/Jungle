require 'pp'

class OrdersController < ApplicationController
  

  def show

    # @Order = 
    # <Order id: 5, 
    # total_cents: 553575, 
    # created_at: "2021-07-21 23:56:00", 
    # updated_at: "2021-07-21 23:56:00", 
    # strispe_charge_id: "ch_1JFpGdFsXliwGi5nv945CBzy", 
    # email: "kvirani@gmail.com">

    # params =
    # {"controller"=>"orders", "action"=>"show", "id"=>"6"}
  
    @order = Order.find(params[:id])
    
    # pp @order.line_items.first.product
    # implicitly renders show.html.erb from the orders directory
    
  end

  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    if order.valid?
      empty_cart!
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_subtotal_cents,
      description: "Khurram Virani's Jungle Order",
      currency:    'cad'
    )
  end

  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_subtotal_cents,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )

    enhanced_cart.each do |entry|
      product = entry[:product]
      quantity = entry[:quantity]
      order.line_items.new(
        product: product,
        quantity: quantity,
        item_price: product.price,
        total_price: product.price * quantity
      )
    end
    order.save!
    order
  end

end
