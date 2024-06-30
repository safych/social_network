class PostDestroyer
  def initialize(post, notice, user_id)
    @post = post
    @notice = notice
    @user_id = user_id
  end

  def destroy
    destroy_post
  end

  private

  def destroy_post
    if @post.user_id == @user_id
      if @post.destroy
        @notice = I18n.t("post_destroyed")
        true
      else
        @notice = I18n.t("post_error_destroyed")
        false
      end
    else
      @notice = I18n.t("you_are_not_current_user")
      false
    end
  end
end