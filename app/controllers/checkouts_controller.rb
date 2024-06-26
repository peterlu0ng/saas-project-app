class CheckoutsController < ApplicationController
  before_action :authenticate_user!

  def show
    current_user.set_payment_processor :stripe
    current_user.payment_processor.customer

    @checkout_session = current_user
                        .payment_processor
                        .checkout(
                          mode: 'subscription',
                          line_items: 'price_1PWtdKI4Zyhf3cOmWJ4OlIbP',
                          success_url: checkout_success_url
                            )
  end

  def success
    @session = Stripe::Checkout::Session.retrieve(params[:session_id])
    @line_items = Stripe::Checkout::Session.list_line_items(params[:session_id])
    current_user.paid = true
    current_user.save!
  end
end
