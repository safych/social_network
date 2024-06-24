class LikesController < ApplicationController
    before_action :find_like

    def create

    end

    def destroy

    end

    private

    def find_like
        @like = Like.find(params[:like_id])
    end
end