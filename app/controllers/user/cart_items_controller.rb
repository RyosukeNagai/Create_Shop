class User::CartItemsController < ApplicationController
	def confirm
	end

	def update
	end

	def create
	end

	def destroy_all
	end

	def destroy
	end

	def cart_item_params # カートに送られるステータス
      params.require(:cart_item).permit(:user_id, :product_id, :count)
    end
end
