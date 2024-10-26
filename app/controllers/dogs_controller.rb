class DogsController < ApplicationController
  before_action :set_dog, only: %i[ show edit update destroy ]

  def index
    @dogs = Dog.includes(:dog_images, :breeds).all
  end

  def show
    # Join on breed and image tables
    @dog = Dog.includes(:dog_images).find(params[:id])
  end

  def new
    @dog = Dog.new
  end

  def edit

  end

  def update
    
  end
  
  def destroy
    
  end

end
