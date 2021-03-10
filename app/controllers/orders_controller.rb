class OrdersController < ApplicationController
  def create
    session = Session.find(params[:session_id])
    order = Order.create!(session: session, session_sku: session.activity.name, amount: session.price, state: 'pending', user: current_user)

    checkout_session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: session.activity.name,
        images: [url_for(session.category.photo)],
        amount: session.price_cents,
        currency: 'gbp',
        quantity: 1
      }],
      success_url: booking_create_url(session_id: session.id, user_id: current_user.id),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: checkout_session.id)
    redirect_to checkout_path(order_id: order.id)
  end

  def checkout
     @order = current_user.orders.where(state: 'pending').find(params[:order_id])
  end
end
