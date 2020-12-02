class Shipping < ApplicationRecord
	belongs_to :user

    def view_shipping
      postcode
    end
end
