class ProductsController < ApplicationController
  def index
  	@products = Product.all
  	@index_title = "商品"
  	@category = Category.where(is_active: "有効")
  end

  def show
  	@categories = Category.where(is_active: "有効")
  	@product = Product.find(params[:id])
  	@cart_item = CartItem.new
  	@tax_price = (@product.price * 1.1).to_i
  end
end
