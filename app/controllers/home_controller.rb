class HomeController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.limit(10).order(id: :desc)
  end
end