Library::Application.routes.draw do
  root :to => 'welcome#home'
  resources :books
  resources :patrons

  get 'checkout' => 'transactions#checkout'
  get 'checkin' => 'transactions#checkin'
  post 'checkin_book' => 'transactions#checkin_book'
  get 'history' => 'transactions#history'
end
