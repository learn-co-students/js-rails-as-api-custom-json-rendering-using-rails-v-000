class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds
  end
 
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: {id: bird.id, name: bird.name, species: bird.species}
      # render json: bird.slice(:id, :name, :species) you can also use the .slice method to achive the same results 
      # render json: birds, only: [:id, :name, :species] you can also use the only method to display only certain oject elements 
      # render json: birds, except: [:created_at, :updated_at] Alternatively, rather than specifically listing every key we want to include, we could also exclude particular content using the except method
    else
       render json: { message: 'Bird not found' }
  end
end