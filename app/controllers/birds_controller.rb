class BirdsController < ApplicationController
  def index
    @birds = Bird.all
    render json: birds, except: [:created_at, :updated_at]
  end
end
