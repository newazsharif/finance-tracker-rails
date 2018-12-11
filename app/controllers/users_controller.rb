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
  
  def my_friends
    @friends = current_user.friends
  end
  
  def get_user
    if params[:user_str].blank?
      flash.now[:danger] = "You have typed an empty string"
    else
      @users = User.where("(first_name like :user_str or last_name like :user_str or email like :user_str)", :user_str => "%#{params[:user_str]}%")
                    .where.not(:id => current_user.id)
      if @users.blank?
        flash.now[:danger] = "Could not find user!!!"  
      end
    end
    respond_to do |format|
      format.js { render :partial => 'users/friend_search' }
    end
  end
  
  def show
    user_id = params[:id]
    @user = User.find(user_id)
    @user_stocks = Stock.select("id","name","ticker","last_price","user_id").joins(:user_stocks).where('user_stocks.user_id = ?',user_id)
  end
  
  
end