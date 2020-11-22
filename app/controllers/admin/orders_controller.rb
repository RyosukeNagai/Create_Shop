class Admin::OrdersController < ApplicationController
	def top
      now = Time.current
      @orders = Order.where(created_at: now.all_day)
	end

	def index
      @orders = Order.all.order(id: "DESC")
	end

	private

	def order_params
      params.require(:order).permit(:order_status)
    end
end
