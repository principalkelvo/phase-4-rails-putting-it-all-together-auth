class UsersController < ApplicationController
    wrap_parameters format: []
    skip_before_action :authorized, only: :create
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        # if user.valid?
        render json: user, status: :created 
        # else
        #     render json: {errors: user.errors.full_messages}, status: :unprocessable_entity
        #  end
    end

    def show
        user = User.find(session[:user_id])
        render json: user, status: :created

    end

    private
    def user_params
      params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end

    def render_unprocessable_entity(invalid)
      render json: {error: invalid.record.errors}, status: :unprocessable_entity
    end
end
