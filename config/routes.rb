Library::Application.routes.draw do
  root :to => 'welcome#home'
  resources :books
  resources :patrons

  get 'home' => 'welcome#home'
  get 'checkout' => 'transactions#checkout'
  match 'checkout_book' => 'transactions#checkout_book'
  match 'select_book_checkout' => 'transactions#select_book_checkout'
  get 'checkin' => 'transactions#checkin'
  get 'checkin_book' => 'transactions#checkin_book'
  get 'delete' => 'transactions#delete'
  get 'history' => 'transactions#history'
  get 'login' => 'sessions#new'
  match 'create_session' => 'sessions#create'
  match 'logout' => 'sessions#destroy'
end
