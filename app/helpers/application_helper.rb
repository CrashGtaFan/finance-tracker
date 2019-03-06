module ApplicationHelper
  def stock_error
    reason =
      if !current_user.under_stock_limit?
        '10 stocks'
      elsif current_user.stock_arleady_added?(@stock.ticker)
        'that stock'
      end
    "Stock cannot be added because you added #{reason}"
  end
end
