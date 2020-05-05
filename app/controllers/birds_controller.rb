class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [:created_at, :updated_at]
    render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: { id: bird.id, name: bird.name, species: bird.species }
    # render json: bird.slice(:id, :name, :species)

    # render json: bird, only: [:id, :name, :species] # This works, too
    # render json: bird.except(:created_at, :updated_at) # This does NOT

    if bird
      # render json: { id: bird.id, name: bird.name, species: bird.species }
      render json: bird.as_json(except: [:created_at, :updated_at]) # THIS WORKS!!!
    else
      render json: { message: 'Bird not found' }
    end
  end
end

# Interesting: In the #index action, each bird's attributes are displayed alphabetically by key, regardless of their order in #only.
# But in the show action, the bird's attributes are displayed in the order that the keys were passed to #slice.