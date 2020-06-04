Rails.application.routes.draw do
  get 'charges/new'

  resources :wikis do
    resources :collaborators, only: [:create, :destroy]
  end
  resources :charges, only: [:new, :create]
  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'downgrade_charge' => 'charges#downgrade'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
