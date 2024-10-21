class DogController < ApplicationController
  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
  end

  def def new
    @dog = Dog.new
  end
  

  def edit
  end
end
