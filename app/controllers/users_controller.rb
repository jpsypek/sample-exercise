class UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users, status: 200
  end

  def create
    @user = User.new(user_params)
      if @user.save
        render json: @user, status: 201
      else
        render json: { :errors => @user.errors.full_messages }, status: 422
      end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :social_security_number, :email)
  end

end
