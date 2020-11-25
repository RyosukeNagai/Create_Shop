class Admin::UsersController < ApplicationController
	def index
      @users = User.all
	end

	def show
	  @user = User.find(params[:id])
	end

	def edit
	  @user = User.find(params[:id])
	end

	def update
	  @user = User.find(params[:id])
	end

	private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :phone_number, :email, :password, :is_active)
    end
end
