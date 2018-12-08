class UsersController < ApplicationController
  def my_portfolio
    @stock = Stock.new
    @user_stocks = Stock.select("id","name","ticker","last_price","user_id").joins(:user_stocks).where('user_stocks.user_id = ?',current_user.id)
  end
  
  def destroy_stock
    stock_id = params[:id]
    user_stock = UserStock.find_by_user_id_and_stock_id(current_user.id,stock_id)
    
    user_stock.delete
    flash[:success] = "Stock track removed successfully!!!"
    redirect_to my_portfolio_path
  end
end