class TalentsController < ApplicationController
	def index
		@user = current_user
		@talents = @user.talents
	end
	
	def show
	end

	def new
		@user = current_user
		@talent = Talent.new
	end
	def edit
		@user = current_user
		@talent = Talent.find(params[:id])
	end

	def create
		talent = Talent.new(talent_params)
		talent.update(user_id: current_user.id)
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
