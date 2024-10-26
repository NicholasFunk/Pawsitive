class DogsController < ApplicationController
  def index
    @dogs = Dog.includes(:dog_images, :breeds).all
  end

  def show
    # Join on breed and image tables
    @dog = Dog.includes(:dog_images).find(params[:id])
  end
end
