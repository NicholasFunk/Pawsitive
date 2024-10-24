class DogsController < ApplicationController
  def index
    @dogs = Dog.includes(:dog_images).all
  end

  def show
    # Join on breed and image tables
    @dog = Dog.find(params[:id])
  end
end
