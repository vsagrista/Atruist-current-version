module UsersHelper

  def get_not_accepted_transactions(transactions)
    transactions.where(accepted: false)
  end

  def get_not_rated_transactions(transactions)
    transactions.where(accepted: true, rated: false)
  end

  def get_recipient(transaction)
    transaction.recipient
  end

  def done_transactions(transaction)
    transaction.where(accepted: true, rated: true)
  end

  def cancelled_transactions(transaction)
    transaction.where(cancelled: true)
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
