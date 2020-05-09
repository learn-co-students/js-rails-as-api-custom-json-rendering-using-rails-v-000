class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end

  def show #The simplest way to make data more useful to us is to provide more routes and actions that help to divide and organize our data. 
    Adding Additional Routes to Separate JSON Data
    bird = Bird.find_by(id: params[:id])
    render json: bird 
    
    Removing Content When Rendering
    render json: {id: bird.id, name: bird.name, species: bird.species } #ruby
    render json: bird.slice(:id, :name, :species) #ruby
    render json: birds, only: [:id, :name, :species] #rails
    
    Drawing Back the Curtain on Rendering JSON Data
    render json: birds.to_json(except: [:created_at, :updated_at]) #rails
  end
end