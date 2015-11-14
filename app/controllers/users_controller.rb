class UsersController < ApplicationController
include UsersHelper
  before_action :authenticate_user!
  def index
  end

  def dashboard
    @user = current_user	
  end
  
  def show
  	@user = User.find(params[:id])
  end

  def redirect_to_dashboard
    redirect_to '/users/dashboard'
  end

  def welcome_page
  end

  def address
    @user = current_user  
  end

  def update
  end
end
