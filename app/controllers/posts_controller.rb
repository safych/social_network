class PostsController < ApplicationController
  before_action :authenticate_user!, except: :show
  before_action :find_post, only: [:destroy, :update, :show]

  def create
    @post = Post.new(post_params.merge(user_id: current_user.id))
    if @post.save
      flash[:done] = I18n.t("post_created")
    else
      flash[:error] = I18n.t("post_error")
    end
    redirect_to root_path
  end

  def destroy
    notice = nil
    if PostDestroyer.new(@post, notice, current_user.id).call
      flash[:done] = notice
    else
      flash[:error] = notice
    end
    redirect_back(fallback_location: root_path)
  end

  def update

  end

  def show
    @comment = Comment.new
    @comments = Comment.where(post_id: @post.id).limit(50).order(id: :desc)
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :description, :avatar)
  end
end