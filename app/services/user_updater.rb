class UserUpdater
  def initialize(user, params, controller)
    @user = user
    @params = params
    @controller = controller
  end

  def update
    update_param
  end

  private

  def update_param
    if @user.valid_password?(@params[:password])
      if @user.update(@params.except(:password))  
        bypass_sign_in(@user)
        true
      else
        @user.errors.add(:base, I18n.t("is_incorrect_data"))
        false
      end
    else
      @user.errors.add(:password, I18n.t("is_incorrect_password"))
      false
    end
  end

  def bypass_sign_in(user)
    @controller.sign_in(user, bypass: true)
  end
end