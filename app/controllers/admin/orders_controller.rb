class Admin::OrdersController < ApplicationController

  def edit
    @orders = Order.all
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to edit_admin_orders_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:name, :created_at, :postal_code, :address, :payment_method, :status)
  end
end
