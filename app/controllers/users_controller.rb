class UsersController < ApplicationController
  
  def show
    @user = current_user
  end

  def index
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def delete
    @user = current_user
  end

  def destroy
    @user = current_user
    # 論理削除に合わせて、会員ステータスを退会済に変更させる
    @user.update(is_active: "退会済")
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :password, :postcode, :prefecture_code, :address_city, :address_street, :address_building, :is_active, :phone_number)
  end
end

