class TalentsController < ApplicationController
	def index
		@user = current_user
		@talents = @user.talents
	end
	def show
	end
	def edit
	end
	def update
	end
end
