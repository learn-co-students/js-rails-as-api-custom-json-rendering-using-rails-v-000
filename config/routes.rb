Rails.application.routes.draw do
  get '/birds' => 'birds#index'
  get '/birds/:id' => 'birds#show' # new
end