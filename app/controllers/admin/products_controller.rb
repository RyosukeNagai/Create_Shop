class Admin::ProductsController < ApplicationController
	def index
      @products = Product.all
	end

	def new
      @product = Product.new
	end

	def create
	  @product = Product.new(product_params)
	end

	private

	def product_params
      params.require(:product).permit(:name, :introduction, :size, :price, :is_active, :image)
    end

end
