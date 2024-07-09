class CommentUpdater
  attr_reader :comment, :params, :current_user
  attr_accessor :notice

  def initialize(comment, params, current_user, notice)
    @comment = comment
    @params = params
    @current_user = current_user
    @notice = notice
  end

  def call
    update
  end

  private

  def update
    if @comment.user == @current_user
      if @comment.update(@params)
        @notice = I18n.t("comment_updated")
        true
      else
        @notice = I18n.t("comment_not_updated")
        false
      end
    else
      @notice = I18n.t("you_are_not_current_user")
      false
    end
  end
end