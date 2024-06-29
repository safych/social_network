class HomeController < ApplicationController
  def index
    @post = Post.new
    @posts = Post.all.limit(10).last
  end
end