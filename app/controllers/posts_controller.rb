class PostsController < ApplicationController
    before_action :find_post

    def create

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
end