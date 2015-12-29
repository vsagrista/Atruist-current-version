class TransactionsController < ApplicationController
  def new
    @user = current_user
    @receiver = User.find(params[:user_id])
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

  def show
    @user = current_user
    @transaction = Transaction.find(params[:id])
    @talent = Talent.where(transaction_id: @transaction.id)
    @sender = User.find(@transaction.sender_id)
    @recipient = User.find(@transaction.recipient_id)
  end

  def edit

  end

#10
  def update
    #binding.pry
    transaction = Transaction.find(params[:id])
    if params[:commit] == "Accept Exchange"
      flash[:notice] = "Exchange accepted!"
      transaction.update(accepted: true)
      redirect_to users_dashboard_path 
    else 
      if transaction.cancelation_count == 2
        flash[:notice] = "You have cancelled twice, you cannot cancel again"
        redirect_to :back
      else
        flash[:notice] = "Exchange cancelled!" 
        transaction.update(cancelled: true, cancelation_count: transaction.cancelation_count+1)
        redirect_to users_dashboard_path
      end
    end
  end

  private
  def transaction_params
    params.require(:transaction).permit(
      :subject, :minutes, :accepted, :accepted, :cancelled,
    :cancelation_count, :review, :review_comment)
    .merge(
      talents_id: params[:talent_id],
      sender_id: current_user.id,
      recipient_id: User.get_user_from_talent_id(params[:talent_id]),
      date: Transaction.get_datetime_format(params[:transaction][:date]),
    token: Transaction.generate_token(current_user))
  end
end
