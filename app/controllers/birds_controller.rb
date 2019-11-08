class BirdsController < ApplicationController
  def index
    birds = Bird.all
    if birds
      render json: birds, only: [:id, :name, :species]
    else
      render json: { message: 'Birds not found' }
    end
  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird, except: [:created_at, :updated_at]
    else
      render json: { message: 'Bird not found' }
    end
    #The if else conditional is used to provide basic error messaging.

    #The controller actions we have seen so far have a bit of Rails 'magic' in them that obscures what is actually happening in the render statements. 
    #The only and except keywords are actually parameters of the to_json method, obscured by that magic. 
    #The last code snippet can be rewritten in full to show what is actually happening:
    # def index
    #   birds = Bird.all
    #   render json: birds.to_json(except: [:created_at, :updated_at])
    # end
    #As customization becomes more complicated, writing in sometimes help to clarify what is happening

    # You might also see the hash slice method being used like this:
    # render json: bird.slice(:id, :name, :species)
    # or just a hash with the keys and values laid out explicitly like this:
    # render json: {id: bird.id, name: bird.name, species: bird.species } 
  end
end