class User::CartItemsController < ApplicationController
	before_action :authenticate_user!
	def confirm
	  @cart_items = current_user.cart_items
	end

	def update
	  @cart_item = CartItem.find(params[:id])
	  @cart_item.update(cart_item_params)
	  redirect_to cart_items_confirm_path
	end

	def create
	  @cart_item = CartItem.new(cart_item_params)  # ステータス渡す為の空のカート作成
	  @cart_item.user_id = current_user.id # カートのidはユーザーと同じと定義
	  @cart_item.save
      redirect_to cart_items_confirm_path
	end

	def destroy_all
	  CartItem.where(user_id: current_user.id).destroy_all # カートに紐づいてるユーザーのid取得
      redirect_to cart_items_confirm_path
	end

	def destroy
	  @cart_item = CartItem.find(params[:id])
	  @cart_item.destroy
	  redirect_to cart_items_confirm_path
	end

	def cart_item_params # カートに送られるステータス
      params.require(:cart_item).permit(:user_id, :product_id, :count)
    end
end

