class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def update
    if UserUpdater.new(@user, user_params, self).update
      redirect_to profile_path, notice: I18n.t("profile_was_successfully_updated")
    else
      render :show, layout: "profile"
    end
  end

  private

  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:username, :born_on, :name, :surname, :password)
  end
end