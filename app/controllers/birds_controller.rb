class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: @birds
  end
#Adding Additional Routes to Separate JSON Data
  if bird
    render json: { id: bird.id, name: bird.name, species: bird.species }
  else
    render json: { message: 'Bird not found' }
  end

  #When using find_by, if the record is not found, nil is returned. As we have it set up, if params[:id] does not match a valid id, nil will be assigned to the bird variable.
#As nil is a false-y value in Ruby, this gives us the ability to write our own error messaging in the event that a request is made for a record that doesn't exist:
end