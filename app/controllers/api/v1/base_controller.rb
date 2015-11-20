class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :destroy_session

  def destroy_session
    request.session_options[:skip] = true
  end

  def index
    @talents = Talent.all
    render :json => @talents
  end

  def show
  	talent = Talent.where(id: params[:id])
  	unless talent.empty?
  		render :json => talent
  	else 
  		render :json => "No talent found"
  	end
  end

  def addresses
  	render :json => User.all.collect! {|user| user.address}
  end

  def cities
  	render :json => User.all.collect! {|user| user.address}.collect {|address| address.split(",")[1]}	
  end


end