module ApplicationHelper
  def tickerExists?(stock,user)
    dbStock = Stock.find_by_ticker(stock.ticker)
    
    if dbStock.blank?
      
      return false
      
    else
      check_stock_for_user = UserStock.find_by_user_id_and_stock_id(current_user.id,dbStock.id)
      return check_stock_for_user.present?
    end
  end
end
