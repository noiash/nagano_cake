class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_details, dependent: :destroy
    enum status: { waiting_for_payment: 0, payment_confirmmation: 1, in_production: 2, ready_to_ship: 3, sent: 4 }
    enum payment_method: { credit_card: 0, transfer: 1 }

    def with_tax_price
        (price * 1.1).floor
    end

end
