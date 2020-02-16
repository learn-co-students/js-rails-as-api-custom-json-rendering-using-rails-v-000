class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # render json: birds, except: [:Created_at, :updated_at]
  end

  # basic error messaging when rendering JSON data
  def show
    #  if record is not found it will return nil(false-y value)
    bird = Bird.find_by(id: params[:id])
    # to cover error messages
    if bird 
      render json: { id: bird.id, name: bird.name, bird.species }
    else 
      render json: { message: 'Bird not found' }
    end 
  end 
end