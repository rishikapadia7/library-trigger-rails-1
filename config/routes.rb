Library::Application.routes.draw do
  root :to => 'welcome#home'
  resources :books
  resources :patrons

  get 'checkout' => 'transactions#checkout'
  get 'checkin' => 'transactions#checkin'
  get 'history' => 'transactions#history'
end