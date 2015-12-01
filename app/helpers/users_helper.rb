module UsersHelper
	def get_sent_trans_not_accepted(user)
		Transaction.where(sender: user.id)
	end

	def get_sent_trans_not_rated(user)
		Transaction.where(sender: user.id).select {|transaction| transaction.accepted && !transaction.rated}
	end

	def get_received_trans_not_accepted(user)
		Transaction.where(recipient: user.id)
	end

	def get_received_trans_not_rated(user)
		Transaction.where(recipient: user.id).select {|transaction| transaction.accepted && !transaction.rated}
	end

	def get_recipient(transaction)
		transaction.recipient
	end
end
