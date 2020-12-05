class Admin::OrderDetailsController < ApplicationController
  def update
    # @order_detailを取得
    @order_detail = OrderDetail.find(params[:id])
    # @order_detailに紐づく@orderを取得
    @order = Order.find(@order_detail.order_id)
    # @orderに紐づくorder_detailを全て取得
    @all_order_details = OrderDetail.where(order_id: @order.id)
    # その中から、制作ステータスが制作完了になっているorder_detailを全て取得
    @complete_order_details = @all_order_details.where(work_status: "制作完了")
    @order_detail.update(order_detail_params)
    if @order_detail.work_status == "製作中"
       # order_detailのどれかが制作中になれば、@orderの注文ステータスを制作中にする
       @order.update(order_status: "製作中")
    else
      @all_order_details.count == @complete_order_details.count
      # @orderに紐づくorder_detailの数と、その中の制作ステータスが制作完了になっている
      # order_detailの数が一致すれば注文ステータスを発送準備中にする
      @order.update(order_status: "発送準備中")
    end
    redirect_to admin_order_path(@order)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:work_status)
  end
end
