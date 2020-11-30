class Shipping < ApplicationRecord
	belongs_to :user

	def view_shipping
      postcode + prefecture_code + address_city + address_street + address_building + name
    end
end
