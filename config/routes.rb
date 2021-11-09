Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/plots', to: 'plots#index'
  get 'plots/:id/edit', to: 'plots#edit'
  patch 'plots/:id', to: 'plots#update'
end
