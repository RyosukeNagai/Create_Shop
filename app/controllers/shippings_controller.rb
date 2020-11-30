class ShippingsController < ApplicationController

	def index
	  @shippings = Shipping.where(user_id: current_user.id)
      @shipping = Shipping.new
	end

	def new
	end

	def create
	end

	def show
	end

	def edit
	  @shipping = Shipping.find(params[:id])
	end

	def update
	end

	def destroy
	end

	private

	def shipping_params
      params.require(:shipping).permit(:user_id, :name, :postcode, :prefecture_code, :address_city, :address_street, :address_building)
    end
end
