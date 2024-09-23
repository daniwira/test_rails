class Entity < ApplicationRecord
    has_one :wallet, as: :entity, dependent: :destroy
    after_create :create_wallet
  
    private
  
    def create_wallet
      Wallet.create!(entity: self)
    end
  end
  
  # app/models/user.rb
  class User < Entity
  end
  
  # app/models/team.rb
  class Team < Entity
  end
  
  # app/models/stock.rb
  class Stock < Entity
  end
  