class Admin::UsersController < ApplicationController
	def index
      @users = User.all
	end

	private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :phone_number, :email, :password, :is_active)
    end
end
