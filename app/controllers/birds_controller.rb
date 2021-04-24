class BirdsController < ApplicationController
  def index
    birds = Bird.all
#    render json: birds, except: [:created_at, :updated_at] # to filter
    render json: birds.to_json(except: [:created_at, :updated_at]) #do the same as above
  end
  def show
   bird = Bird.find_by(id: params[:id])
#   render json: bird
#   render json: bird.slice(:id, :name, :species)
    # render json: bird, only: [:id, :name, :species]
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
 end

end
