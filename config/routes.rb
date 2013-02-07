Library::Application.routes.draw do
  root :to => 'welcome#home'
  resources :books
  resources :patrons
  resources :transactions

  get 'checkout' => 'transactions#checkout'
  get 'checkin' => 'transactions#checkin'
  get 'checkin_book' => 'transactions#checkin_book'
  get 'delete' => 'transactions#delete'
  get 'history' => 'transactions#history'
  get 'login' => 'sessions#new'
  match 'create_session' => 'sessions#create'
  match 'logout' => 'sessions#destroy'
end
