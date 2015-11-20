class TalentsController < ApplicationController
	require 'yaml'
	def index
		@user = current_user
		@talents = @user.talents
	end
	
	def show
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

	private 
	  def talent_params
	    params.require(:talent).permit(:name,:description)
	  end
end
