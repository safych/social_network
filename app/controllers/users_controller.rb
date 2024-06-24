class UsersController < ApplicationController
    before_action :find_user

    def create

    end

    def update

    end

    private

    def find_user
        @user = User.find(params[:id])
    end

    def update_name

    end

    def update_password

    end
end