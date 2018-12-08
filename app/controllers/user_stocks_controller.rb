class UserStocksController < ApplicationController
  def create
    stock = Stock.find_by_ticker(params[:stock_ticker])
    if stock.blank?
      stock =Stock.new_from_lookup(params[:stock_ticker])
      stock.save
    end
    
    stockCount = UserStock.where(:user_id => current_user.id).count
    
    if stockCount < 10
    
      check_stock_for_user = UserStock.find_by_user_id_and_stock_id(current_user.id,stock.id)
      if check_stock_for_user.present?
        flash[:danger] = "This ticker is already addded for current user"
      else
        @user_stocks = UserStock.new(:user => current_user, :stock => stock)
        @user_stocks.save
        flash[:success] = "#{params[:stock_ticker]} is successfully added to current user"
          
      end
    else
      flash[:danger] = "Cannot add more than 10 ticker for an user"
    end
    
    
    redirect_to my_portfolio_path
    
  end
  
  
end