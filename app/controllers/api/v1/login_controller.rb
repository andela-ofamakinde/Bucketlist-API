class Api::V1::LoginController < ApplicationController

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      # if loged in, token should be passed to the url header
      # require "pry-nav"; binding.pry
      render json: { token: user.auth_token }
    else
      render json: { error: 'Incorrect credentials' }, status: 401
    end
  end

  def delete
    @current_user = nil
  end

before_filter :set_user, only: [:create]
      before_action :authenticate, only: [:logout]


      def create
        if @user
          p @user
          unless Time.now.to_i > @user.expired.to_i
            render json: @user
          else
            @user.save
            render json: @user
          end
        else
          render json: "Unauthorized", status: 404
        end
      end

      def logout
        @user = @current_user
        @user.expired = Time.now
        if @user.save
          render json: "Logged out"
        else
          render json: "An error occured"
        end
      end

      def default_serializer_options
        {root: false}
      end

      private
        def set_user
          @user = User.find_by(email: params[:email], password: params[:password])
        end
    end
  end
  
end
