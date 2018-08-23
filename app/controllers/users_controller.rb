class UsersController < ApplicationController
  def create
    @user = current_user.users.build(user_params)
    if @user.save
      UserMailer.creation_confirmation(@user).deliver_now
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:create)
  end
end
