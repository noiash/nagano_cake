class Admin::OrdersController < ApplicationController

  def edit
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = OrderDetail.all
    @order_detail = OrderDetail.find(params[:id])
    binding.pry
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: order.status)
    @order.status = params[:order][:status].to_i
    redirect_to admin_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:name, :created_at, :postal_code, :address, :payment_method, :status)
  end


end
