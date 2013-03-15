Library::Application.routes.draw do
  root :to => 'welcome#home'
  resources :books
  resources :patrons
  resources :transactions

  get 'home' => 'welcome#home'
  match 'books/delete/:id' => 'books#destroy'
  match 'patrons/delete/:id' => 'patrons#destroy'
  match 'libs/delete/:id' => 'libs#destroy'
  match "homes" => 'welcome#home'
  get 'checkin_action' => 'transactions#checkin_action'
  match 'checkin' => 'transactions#checkin'
  match 'checkout' => 'transactions#checkout'
  get 'delete' => 'transactions#delete'
  get 'history' => 'transactions#index'
  get 'login' => 'sessions#new'
  match 'create_session' => 'sessions#create'
  match 'logout' => 'sessions#destroy'
end
