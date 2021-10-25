class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @cart_items = CartItem.all
    @order_details = OrderDetail.all
  end
end
