class Admin::HomesController < ApplicationController

  def top
    @orders = Order.all
    @cart_items = CartItem.all
  end
end
