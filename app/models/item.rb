class Item < ApplicationRecord
    has_many :order_details, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    belongs_to :genre

    attachment :image
    #消費税を求めるメソッド
    def with_tax_price
        (price * 1.1).floor
    end
end
