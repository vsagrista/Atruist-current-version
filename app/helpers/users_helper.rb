module UsersHelper

  def get_not_accepted_transactions(transactions)
    transactions.select {|transaction| transaction.accepted == false}
  end

  def get_not_rated_transactions(transactions)
    transactions.select {|transaction| transaction.accepted && !transaction.rated }
  end

  def get_recipient(transaction)
    transaction.recipient
  end

  def get_done_transactions(user)
    transactions = Transaction.where("sender_id = ? OR recipient_id = ?",user.id,user.id)
    transactions.select {|transaction| transaction.accepted && transaction.rated }
  end

  def get_cancelled_transactions(user)
    transactions = Transaction.where("sender_id = ? OR recipient_id = ?",user.id,user.id)
    transactions.select {|transaction| transaction.cancelled }
  end

=begin
	case sent...waiting for somebody
		not accepted: 
		transactions.where(accepted: false)


		accepted, not rated:
		transactions.where(accepted: true, rated: false)

	case received...wating for user
		not accepted: 
		accepted, not rated:

=end 

end
