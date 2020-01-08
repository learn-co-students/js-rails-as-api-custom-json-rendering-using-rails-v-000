class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # OR
    # render json: birds, except: [:created_at, :updated_at]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    render json: {id: bird.id, name: bird.name, species: bird.species }
    # OR
    #  render json: bird.slice(:id, :name, :species)
  end
end
