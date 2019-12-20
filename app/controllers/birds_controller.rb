class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: @birds
    # only: option directly after listing an object we want to render to JSON:

    # render json: birds, only:[:id, :name, :species]

    # Or another option
    render json: birds, except:[:created_at, :updated_at]


  end

  def show 
    bird = Bird.find_by(id: params[:id])
    # render json: bird

    # Rendering specific information

    # render json: {id: bird.id, name: bird.name, species: bird.species}

    # Alternative using slice
    # render json: bird.slice(:id, :name, :species )

    # rendering with error message 
    if bird 
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end 
  end 
end