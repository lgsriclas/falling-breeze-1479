Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/plots', to: 'plots#index'
  get '/gardens/:id', to: "gardens#show"
  get '/plots/:id/edit', to: 'plots#edit'
  patch '/plots/:id', to: 'plots#update'
  delete '/plots/:plot_id/plants/:plant_id', to: 'plot_plants#destroy'
end
