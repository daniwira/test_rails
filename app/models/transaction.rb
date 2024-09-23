# app/models/transaction.rb
class Transaction < ApplicationRecord
    belongs_to :source_wallet, class_name: 'Wallet', optional: true
    belongs_to :target_wallet, class_name: 'Wallet', optional: true
  
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validate :validate_wallets
  
    after_create :update_wallet_balances
  
    private
  
    def validate_wallets
      if transaction_type == 'credit' && source_wallet.present?
        errors.add(:source_wallet, "should be nil for credit transactions")
      elsif transaction_type == 'debit' && target_wallet.present?
        errors.add(:target_wallet, "should be nil for debit transactions")
      end
    end
  
    def update_wallet_balances
      Wallet.transaction do
        if transaction_type == 'credit'
          target_wallet.increment!(:balance, amount)
        elsif transaction_type == 'debit'
          source_wallet.decrement!(:balance, amount)
        end
        source_wallet.calculate_balance if source_wallet.present?
        target_wallet.calculate_balance if target_wallet.present?
      end
    end
  end
  