class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # Works like slice, except for collections
    # fetch(/birds) => [{id:1, name: ""...}, {id:2, name: ""...}]
  end

  def show
    bird = Bird.find_by(id: params[:id])
    render json: bird.slice(:id, :name, :species)
    # It will only return a hash with :name and :email
    # fetch(users/1) => {name: "John", email: "yourface@idk.com"}
  end
end