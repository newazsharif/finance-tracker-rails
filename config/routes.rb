Rails.application.routes.draw do
  devise_for(:users,:controllers => { :registrations => 'user/registrations' })
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root(:to => 'wellcome#index')
  resources(:users, :only => [:show])
  resources(:friendships)
  
  get('my_portfolio',:to => 'users#my_portfolio')
  get('get_stock', :to => 'stocks#get_stock')
  
  post('user_stock', :to => 'user_stocks#create')
  delete('destroy_stock', :to => 'users#destroy_stock')
  get('my_friends', :to => 'users#my_friends')
  get('get_user' , :to => 'users#get_user')
  
end
