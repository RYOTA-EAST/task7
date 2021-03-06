class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:session).permit(:name, :email, :password, :password_confirmation)
  end
end
