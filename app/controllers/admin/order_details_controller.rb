class Admin::OrderDetailsController < ApplicationController

  def update
    @order_details = CartItem.all
  end
end
