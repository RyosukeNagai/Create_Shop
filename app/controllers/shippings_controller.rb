class ShippingsController < ApplicationController

	def index
	  @shippings = Shipping.where(user_id: current_user.id)
      @shipping = Shipping.new
	end

	def new
	end

	def create
	  @shipping = Shipping.new(shipping_params)
	  @shipping.user_id = current_user.id
	  if @shipping.save
	  	 flash.now[:notice] = "新規配送先を登録しました"
	     redirect_to shippings_path
      end
	end

	def show
	end

	def edit
	  @shipping = Shipping.find(params[:id])
	end

	def update
	  @shipping = Shipping.find(params[:id])
	  @shipping.user_id = current_user.id
	  @shipping.update(shipping_params)
	  redirect_to shippings_path
	end

	def destroy
	  @shipping = Shipping.find(params[:id])
      @shipping.destroy
      redirect_to shippings_path
	end

	private

	def shipping_params
      params.require(:shipping).permit(:user_id, :name, :postcode, :prefecture_code, :address_city, :address_street, :address_building)
    end
end
