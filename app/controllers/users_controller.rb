class UsersController < ApplicationController
  def my_portfolio
    @stock = Stock.new
    
  end
end