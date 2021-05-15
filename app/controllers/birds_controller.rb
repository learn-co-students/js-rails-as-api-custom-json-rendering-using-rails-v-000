class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # # render all attributes for every bird
    # render json: birds
    # # render selected attributes for every bird
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      # # show all bird attributes
      # render json: bird
      # # show selected attribute by construction a hash to render
      # render json: {id: bird.id, name: bird.name, species: bird.species}
      # # show attributes by using slice
      render json: bird.slice(:id, :name, :species)
    else
      render json: { message: 'Bird not found' }
    end
  end
end