class Public::CartItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end

  def update
    @cart_items = CartItem.find(params[:id])
    @cart_items.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_items = CartItem.find(params[:id])
    @cart_items.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def create
    if @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
    # 1. 追加した商品がカート内に存在するかの判別
    # 存在した場合
      @cart_item.amount += params[:cart_item][:amount].to_i
    # 2. カート内の個数をフォームから送られた個数分追加する
      @cart_item.save
    else
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.customer_id = current_customer.id
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
