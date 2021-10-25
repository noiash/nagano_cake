class Admin::OrdersController < ApplicationController

  def edit
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(status: @order.status)
    @order.status = params[:order][:status].to_i
    redirect_to admin_root_path
  end

  private

  def order_params
    params.require(:order).permit(:name, :created_at, :postal_code, :address, :payment_method, :status)
  end

  def order_detail_params
    params.require(:order_detail).permit(:order_id, :item_id, :price, :amount, :making_status)
  end


end
