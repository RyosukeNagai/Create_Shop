class Admin::ProductsController < ApplicationController
	def index
      @products = Product.all
	end

	def new
      @product = Product.new
	end

	def create
	  @product = Product.new(product_params)

	  if @product.save
        redirect_to admin_products_path(@product)
      else
        render :new
     end
	end

	def show
      @product = Product.find(params[:id])
      @tax_price = (@product.price * 1.1).to_i
	end

	def edit
	  @product = Product.find(params[:id])
	end

	def update
	  @product = Product.find(params[:id])
	  @product.update(product_params)
	  redirect_to admin_products_path
	end

	def destroy
	  @product = Product.find(params[:id])
	  @product.destroy
	  redirect_to admin_products_path
	end
	
	private

	def product_params
      params.require(:product).permit(:name, :introduction, :size, :price, :is_active, :image, :category_id)
    end

end

