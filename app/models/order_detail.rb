class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :item

    enum making_status: { cannat_be_manufactured: 0, waiting_for_production: 1, in_production: 2, production_completed: 3 }

    def with_tax_price
        (price * 1.1).floor
    end

end
