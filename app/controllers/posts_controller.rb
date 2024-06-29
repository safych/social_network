class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:destroy, :update, :show]

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      flash[:done] = I18n.t("post_created")
      redirect_to root_path
    else
      flash[:error] = I18n.t("post_error")
      redirect_to root_path
    end
  end

  def destroy

  end

  def update

  end

  def show
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :avatar)
  end
end