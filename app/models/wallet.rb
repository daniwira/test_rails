# app/models/wallet.rb
class Wallet < ApplicationRecord
    belongs_to :user # Hubungkan dengan model User, bisa juga dengan Team atau Stock
  
    has_many :transactions, dependent: :destroy
  
    validates :balance, numericality: { greater_than_or_equal_to: 0 }
    
    # Menghitung saldo berdasarkan transaksi
    def calculate_balance
      self.balance = transactions.sum(:amount)
      save
    end
  end
  