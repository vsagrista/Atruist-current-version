class UsersController < ApplicationController
include UsersHelper
  before_action :authenticate_user!

  
  def dashboard
  	#render :dashboard
  end
  
  def show
  	@user = User.all
  end

  def redirect_to_dashboard
    redirect_to '/users/dashboard'
  end



end
