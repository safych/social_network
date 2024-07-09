class LikeDestroyer
  attr_reader :like, :user_id
  attr_accessor :notice

  def def initialize(like, notice, user_id)
    @like = like
    @notice = notice
    @user_id = user_id
  end

  def destroy
    destroy_like
  end

  private

  def destroy_like
    if @like.user_id == @user_id
      if @post.destroy
        @notice = I18n.t("like_destroyed")
        true
      else
        @notice = I18n.t("like_error_destroyed")
        false
      end
    else
      @notice = I18n.t("you_are_not_current_user")
      false
    end
  end
end