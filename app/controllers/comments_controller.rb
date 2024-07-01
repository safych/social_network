class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, only: [:destroy, :update]

  def create
    @comment = Comment.new(comment_params.merge(user_id: current_user.id))
    if @comment.save
      flash[:done] = I18n.t("comment_created")
    else
      flash[:error] = I18n.t("comment_error_create")
    end
    redirect_back(fallback_location: root_path)
  end

  def update

  end

  def destroy
    notice = nil
    if CommentDestroyer.new(@comment, notice, current_user.id).call
      flash[:done] = notice
    else
      flash[:error] = notice
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:description, :post_id)
  end
end