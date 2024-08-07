class CommentDestroyer
  attr_reader :comment, :user_id
  attr_accessor :notice

  def initialize(comment, notice, user_id)
    @comment = comment
    @notice = notice
    @user_id = user_id
  end

  def call
    destroy
  end

  private

  def destroy
    if @comment.user_id == @user_id
      if @comment.destroy
        @notice = I18n.t("comment_destroyed")
        true
      else
        @notice = I18n.t("comment_error_destroyed")
        false
      end
    else
      @notice = I18n.t("you_are_not_current_user")
      false
    end
  end
end