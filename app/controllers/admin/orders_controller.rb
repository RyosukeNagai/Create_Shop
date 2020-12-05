class Admin::OrdersController < ApplicationController
	def top
      now = Time.current
      @orders = Order.where(created_at: now.all_day)
	end

	def index
      @orders = Order.all.order(id: "DESC")
	end

	def show
	  @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
	end

	def update
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(params[:order_id])
    @order.update(order_params)
    if @order.order_status == "入金確認"
      # 注文ステータスの変更で、それぞれの制作ステータスを変更
      @order_details.each do |order_detail|
        order_detail.update(work_status: "制作待ち")
      end
    end
    redirect_to admin_order_path(@order)
  end

	private

	def order_params
      params.require(:order).permit(:order_status)
    end
end
