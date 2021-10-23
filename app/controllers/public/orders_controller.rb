class Public::OrdersController < ApplicationController

  def new
  end

  def confirm
    if params[:select_address] == 1
      @order.postal_code = current_customer.postal_code
   　  @order.address = current_customer.address
　　  @order.name = current_customer.full_name

    elsif params[:select_address] == 2
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:select_address] == 3
      @order = Order.new(order_params)

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
