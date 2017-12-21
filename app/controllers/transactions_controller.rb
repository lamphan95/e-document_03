class TransactionsController < ApplicationController
  authorize_resource

  def index
    @search = PublicActivity::Activity.ransack trackable_type_eq:
      Settings.trackable.transaction, owner_id_eq: current_user.id
    @transactions = @search.result.page params[:page]
  end

  def create
    @user = current_user
    @transaction = current_user.transactions.new transaction_params
    unless @user && @transaction && @transaction.save
      @transaction.errors.add :save, t("transaction.save_fail")
    end
    UserMailer.delay.buy_coin @user, @transaction
    @transaction.create_activity :create_transaction, owner: current_user,
      parameters: {coin: @transaction.coin, cost: @transaction.cost_at_buy}
    render partial: "shared/user_info"
  end

  private

  def transaction_params
    params.permit :coin, :cost_at_buy
  end
end
