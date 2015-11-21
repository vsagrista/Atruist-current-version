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

  def get_city_data
    users = User.where("address like ?", "%#{params[:city]}%")
   
    #Array.new(users.length).each_with_index.map { |x,index| [users[index].talents] }
    Array.new(users.length).each_with_index.map { |x,index|  ## gets all talents for a user
      [:name => users[index].name,
       :id   => users[index].id, 
       :talents => users[index].talents.order('rating DESC')] }
    User.where("address like ?", "%badalona%").collect! {|user| user.talents}
  end

  def get_talents_sorted
     binding.pry

  end


end