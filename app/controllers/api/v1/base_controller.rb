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

  def cities
  	render :json => User.all.collect! {|user| user.address}.collect {|address| address.split(",")[1]}	
  end

  def get_users_with_talents_in_city
    users = User.where("address like ?", "%#{params[:city]}%")
    render :json => 
    User.where("address like ?", "%badalona%").collect! {|user| user.talents}
  end

  def get_talents_for_city
    render :json => Talent.where(city: params[:city].split(' ')[0])  
  end


  def get_top_rated_talents_for_city
      talents = Talent.where(city: params[:city]).select{|talent| talent.name == params[:talent]}.sort_by{|talent| talent[:rating]} #.order('rating DESC')
      render :json => top_talents_and_users =  
      Array.new(talents.length).each_with_index.map { |x,index|  ## gets all talents for a user
      [:user_name => User.find( talents[index].user_id ).name,  
        :user_id   => User.find( talents[index].user_id ).id,
        :found => talents[index]
        ] }.reverse
  end


end