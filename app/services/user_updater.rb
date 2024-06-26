class UserUpdater
  def initialize(user, params, controller)
    @user = user
    @params = params
    @controller = controller
  end

  def call
    update
  end

  private

  def update
    if @user.valid_password?(@params[:password])
      if @user.update(@params.except(:password))  
        bypass_sign_in(@user)
        true
      else
        @user.errors.add(:base, I18n.t("is_incorrect_data"))
        false
      end
    else
      @user.errors.add(:base, I18n.t("is_incorrect_password"))
      false
    end
  end

  def bypass_sign_in(user)
    @controller.sign_in(user, bypass: true)
  end
end