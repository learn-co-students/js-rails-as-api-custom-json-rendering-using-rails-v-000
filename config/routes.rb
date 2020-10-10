Rails.application.routes.draw do
  get '/birds' => 'birds#index'
  get 'birds/:id', to: 'birds#show'
end
