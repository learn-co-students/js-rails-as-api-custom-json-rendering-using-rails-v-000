class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:name, :species)
    else
      render json: {message: "OhNoooooo!"}
    end 
  end 
end