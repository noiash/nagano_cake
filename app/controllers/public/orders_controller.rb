class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new
    @cart_items = current_customer.cart_items.all
    if params[:order][:select_method] == 1
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.full_name
    elsif params[:order][:select_method] == 2
      @sta = params[:order][:order_address].to_i
      @order_address = Address.find(@sta)
      @order.postal_code = @order_address.postal_code
      @order.order_address = @order_address.address
      @order.name = @order_address.name
    elsif params[:order][:select_method] == 3
      @order.postal_code = params[:order][:postal_code]
      @order.order_address  = params[:order][:order_address]
      @order.name = params[:order][:name]
    end

    redirect_to orders_confirm_path

  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :postage, :billing_amount, :payment_method, :status)
  end
end
