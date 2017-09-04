class UsersController < ApplicationController

	before_action :set_user, :only => [:show, :edit, :update, :destroy ]
	
	def index
		
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: 'welcome to the site!'
    else
      render 'new'
    end
	end

	def show
		
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def set_user
		
	end
end
