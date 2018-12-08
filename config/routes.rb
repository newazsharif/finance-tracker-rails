Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root(:to => 'wellcome#index')
  get('my_portfolio',:to => 'users#my_portfolio')
  get('get_stock', :to => 'stocks#get_stock')
  
  post('user_stock', :to => 'user_stocks#create')
  delete('destroy_stock', :to => 'users#destroy_stock')
end
