Rails.application.routes.draw do

  devise_for :users
  


  #devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'} #リンクをlogoutにする


  #devise_scope :user do #リンクをlogoutにする
  #  delete 'logout', to: 'devise/sessions#destroy'
  #end







  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books
  resources :users, only: [:index, :show, :edit, :update]

  root 'home#top'


  get "home/about" => "home#about" # get URL => "コントローラ名#アクション名"







end
