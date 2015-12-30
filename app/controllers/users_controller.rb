class UsersController < ApplicationController
include UsersHelper
  before_action :authenticate_user!
  def index
  end

  def dashboard
    @user = current_user	
    @transactions_sender = Transaction.where(sender_id: current_user.id)
    @transactions_recipient = Transaction.where(recipient_id: current_user.id)
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

  def edit 
     @user = current_user  
  end 

  def update
    if current_user.update(user_params)
      flash[:notice] = "Update completed!"
    else 
      flash[:notice] = "Something went wrong!"
    end
    redirect_to '/users/dashboard'
  end

  private 
  def user_params
    params.require(:user).permit(:name,:email,:password,:address, :about)
  end
end
