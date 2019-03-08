class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  
  def full_name
    if first_name || last_name
      "#{first_name} #{last_name}"
    else
      'Anonimus'
    end
  end
  
  def stock_arleady_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end
  
  def under_stock_limit?
    user_stocks.count < 10
  end
  
  def can_add_stock?(ticker_symbol)
    under_stock_limit? && !stock_arleady_added?(ticker_symbol)
  end
end
