# app/controllers/transactions_controller.rb
class TransactionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create]
    def create
      @transaction = Transaction.new(transaction_params)
  
      if @transaction.save
        render json: { message: "Transaction successful", transaction: @transaction }, status: :created
      else
        render json: { errors: @transaction.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def transaction_params
      params.require(:transaction).permit(:amount, :source_wallet_id, :target_wallet_id, :transaction_type)
    end
  end
  