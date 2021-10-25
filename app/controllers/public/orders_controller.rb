class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!, only:[:create]

  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(customer_id: current_customer.id, postage: 800)
    @cart_items = current_customer.cart_items
    @total = 0
    @billing_amount = 0
    @postage = 800

    if params[:order][:payment_method] == "credit_card"
      @order.payment_method = "credit_card"
    elsif params[:order][:payment_method] == "transfer"
      @order.payment_method = "transfer"

    end

    if params[:order][:select_address] == "1"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.full_name

    elsif params[:order][:select_address] == "2"
      @address = Address.find(params[:order][:address_id])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name

    elsif params[:order][:select_address] == "3"
      @order = Order.new(order_params)

    end

  end

  def complete
  end

  def create
    #@order = Order.new(customer_id: current_customer.id, postage: 800)
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new({
        order_id: @order.id,
        item_id: cart_item.item_id,
        price: cart_item.item.with_tax_price,
        amount: cart_item.amount,
        making_status: 0
      })
      #binding.pry
      @order_detail.save
    end

    @cart_items.destroy_all

    redirect_to orders_complete_path

  end

  def index
    @orders = Order.all
    @order_details = OrderDetail.all
    @cart_items = current_customer.cart_items
  end

  def show
    @order_details = OrderDetail.all
    @order = Order.find(params[:id])
    @total = @order.billing_amount - @order.postage

  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :name, :postal_code, :address, :postage, :billing_amount, :payment_method, :status)
  end

end

