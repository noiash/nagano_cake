class Admin::OrdersController < ApplicationController

  def edit
    @orders = Order.all
    @order = Order.find(params[:id])
  end

  def update
  end
end
