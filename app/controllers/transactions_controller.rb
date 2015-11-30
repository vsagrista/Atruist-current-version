class TransactionsController < ApplicationController
	def new
	  @user = current_user
	  @talent = Talent.find(params[:talent_id])
	  @transaction = Transaction.new
	end

	def create
		binding.pry


		#(id: integer, talents_id: integer, sender_id: integer, recipient_id: integer, accepted: boolean, cancelled: boolean, cancelation_count: integer, review: integer, review_comment: string, token: string, created_at: datetime, updated_at: datetime, minutes: integer, subject: string)
		#random_string = SecureRandom.hex.first(6)
	end

end
