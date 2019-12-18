class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, except: [:created_at, :updated_at]

  end

  def show
   bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:name, :species)
    else
      render json: {message: 'no shitty bird found here'}
    end
  end
end
