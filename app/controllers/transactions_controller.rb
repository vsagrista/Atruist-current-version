class TransactionsController < ApplicationController
	def new
	  @user = current_user
	  @talent = Talent.find(params[:talent_id])
	  @transaction = Transaction.new
	end

	def create
		transaction = Transaction.new(transaction_params)
		if transaction.save
			flash[:notice] = "Transaction started!"
			UserMailer.token_email(current_user).deliver_now
			redirect_to users_dashboard_path
    	else 
      		flash[:notice] = transaction.errors.full_messages.to_sentence
    	end
	end

	private
	def transaction_params
		params.require(:transaction).permit(:subject, :minutes)
			.merge(
			talents_id: params[:talent_id],
			sender_id: current_user.id,
			recipient_id: User.get_user_from_talent_id(params[:talent_id]),
			date: Transaction.get_datetime_format(params[:transaction][:date]),
			token: Transaction.generate_token(current_user))
	end
end
