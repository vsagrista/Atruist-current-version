   class TalentsController < ApplicationController
	require 'yaml'
	def index
		@user = current_user
		@talents = @user.talents
	end
	
	def show
		@user = current_user
		@receiver = User.find(params[:user_id])
		@talent = Talent.find(params[:id])
		@transaction = Transaction.new
	end

	def search
		@user = current_user
		@talents = Talent.get_talents_and_cities_names
		@cities = Talent.get_cities
	end

	def new
		@user = current_user
		@talent = Talent.new
		@yaml = (YAML::load_file("#{Rails.root}/config/talent_choices.yml")['profession'] ).sort! { |a,b| a.downcase <=> b.downcase }
	end
	
	def edit
		@user = current_user
		@talent = Talent.find(params[:id])
	end

	def create
		talent = Talent.new(talent_params)
		talent.add_talent_if_not_on_yaml_list(params[:talent][:name])
		talent.user_id = current_user.id
		talent.city = current_user.address.split(",")[1]
		if talent.save
      	flash[:notice] = "Talent saved!"
    else 
      	flash[:notice] = talent.errors.full_messages.to_sentence
    end
      	redirect_to user_talents_path(current_user)
	end

	def update
		talent = Talent.find(params[:id])
		if talent.update(talent_params)
			flash[:notice] = "Talent saved!"
		else 
			flash[:notice] = talent.errors.full_messages.to_sentence
		end
		redirect_to user_talents_path(current_user)
	end

	def edit 
		@user = current_user
		@talent = Talent.find(params[:id])
		@yaml = (YAML::load_file("#{Rails.root}/config/talent_choices.yml")['profession'] ).sort! { |a,b| a.downcase <=> b.downcase }
	end


	private 
	def talent_params
	    params.require(:talent).permit(:name,:description)
	end
end
