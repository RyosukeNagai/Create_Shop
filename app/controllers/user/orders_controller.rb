class User::OrdersController < ApplicationController

  def index
    @orders = Order.where(user_id: current_user.id).order(id: "DESC")
  end

  def new
  	@order = Order.new
    @user_address = Shipping.where(user_id: current_user.id)
    @user = current_user
  end

  def create
    @order = Order.new(order_params) # 新規でオーダーのパラメーター受けとるための
    @order.user_id = current_user.id # オーダーとユーザーの紐付け
    if @order.save
      cart_items = current_user.cart_items # カートアイテムを全取得
      cart_items.each do |cart_item|
        order_detail = @order.order_details.new # 履歴の空を作成、オーダーと履歴紐付け
        order_detail.product_id = cart_item.product_id # カートの商品を取得
        order_detail.count = cart_item.count
        order_detail.price = cart_item.product.price
        order_detail.save  # 注文履歴をセーブ
        cart_item.destroy  # カート内アイテムを空に削除
      end
      redirect_to user_orders_complete_path
    else
      redirect_to new_user_order_path
    end
  end

  def complete
  end

  def show
  end

  def confirm
    @order_products = current_user.cart_items.all # オーダーされた商品とユーザーのカート内商品紐付け
    @order = Order.new # ステータス受けとるための空を作成
    @order.payment_method = params[:payment_method]
    if params[:addresses] == "1" # from_withで定義している
      @order.postcode = current_user.postcode
      @order.prefecture_code = current_user.prefecture_code
      @order.address_city = current_user.address_city
      @order.address_street = current_user.address_street
      @order.address_building = current_user.address_building
      @order.name = current_user.last_name + current_user.first_name

    elsif params[:addresses] == "2"
      @shipping = Shipping.find(params[:select_address])
      @order.postcode = @shipping.postcode
      @order.prefecture_code = @shipping.prefecture_code
      @order.address_city = @shipping.address_city
      @order.address_street = @shipping.address_street
      @order.address_building = @shipping.address_building
      @order.name = @shipping.name

    else params[:addresses] == "3"
         @shipping = Shipping.new # 住所新規登録するためのnew
         # 3を選ばれた際、送られたパラメーターを各カラムで受けとる
         @order.postcode = params[:postcode]
         @order.prefecture_code = params[:prefecture_code]
         @order.address_city = params[:address_city]
         @order.address_street = params[:address_street]
         @order.address_building = params[:address_building]
         @order.name = params[:name]

         # オーダーモデルに渡されたパラメーターをshippingモデルに渡す
         @shipping.user_id = current_user.id # ユーザーの紐付け
         @shipping.postcode = @order.postcode
         @shipping.prefecture_code = @order.prefecture_code
         @shipping.address_city = @order.address_city
         @shipping.address_street = @order.address_street
         @shipping.address_building = @order.address_building
         @shipping.name = @order.name
         @shipping.save
    end
  end

  private

  def order_params
    params.permit(:user_id, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :name, :postage, :total_price, :payment_method, :order_status)
  end
end
