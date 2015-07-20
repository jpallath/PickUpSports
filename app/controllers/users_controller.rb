class UsersController < ApplicationController
	def create
		@user = User.new()
	end

#
#	def user_params
#		#		Not sure if we need this anymore???
#	end

	def new
	end

	def index
  end

	def edit
    authenticate!
	end

	def show
    authenticate!
	end

	def update
    authenticate!
	end

	def destroy
	end

  def login
  end


end
