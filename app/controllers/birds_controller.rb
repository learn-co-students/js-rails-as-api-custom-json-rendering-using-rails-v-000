class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at]
    # Line 5 is Rails magic for the following in Ruby:
    # render json: birds.to_json(except: [:created_at, :updated_at])
  end

  def show
    bird = Bird.find_by(id: params[:id])
    # render json: {id: bird.id, name: bird.name, species: bird.species}
    # a Ruby shorthand for doing the above on a single hash:
    # render json: bird.slice(:id, :name, :species)
    # Rails magic to do the same thing (only and except can be used)
    if bird
      render json: bird, except: [:created_at, :updated_at]
    else
      render json: { message: 'That bird ain\'t there' }
    end
  end
end
