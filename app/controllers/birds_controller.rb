

Rails.application.routes.draw do
  get '/birds' => 'birds#index'
  get '/birds/:id' => 'birds#show'
end


class BirdsController < ApplicationController
  def index
    birds = Bird.all
    # render json: birds
    # render json: birds, only: [:id, :name, :species]
    render json: birds, except: [:created_at, :updated_at, :species, :id]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:id, :name, :created_at)
    else
      render json: {message: "No bird!"}
    end
    # render json: bird
    # render json: {id: bird.id, name: bird.name, species: bird.species }
    # render json: bird.slice(:id, :name, :created_at)
    #ln- helps a lot to read the code aloud. but not so much the code itself,
   #  but what is intended by it. like for the above line, i at first read "id colon bird
   # dot id..." etc. but it was more helpful to say "the id is the bird's id, the name is set to the
   # bird name, etc. These are attributes of the bird. but why have id and name and so on? oh, those
   # are the keys, they're going to structure the data".

  end


end
