class UserUpdater
  attr_reader :params, :controller, :user

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
      if @user.update(user_params)
        bypass_sign_in(@user)
        true
      else
        add_error(:base, I18n.t("is_incorrect_data"))
        false
      end
    else
      add_error(:base, I18n.t("is_incorrect_password"))
      false
    end
  end

  def bypass_sign_in(user)
    @controller.sign_in(user, bypass: true)
  end

  def add_error(attribute, message)
    @user.errors.add(attribute, message)
  end

  def user_params
    @params.except(:password)
  end
end
