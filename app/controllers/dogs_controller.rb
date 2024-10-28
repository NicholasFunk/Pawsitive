class DogsController < ApplicationController
  
  before_action :set_dog, only: %i[ show edit update destroy ]
  require 'net/http'
  require 'json'


  def index
    @dogs = Dog.includes(:dog_images, :breeds).all
  end

  def show
    # Join on breed and image tables
    @dog = Dog.includes(:dog_images).find(params[:id])
  end

  def new
    @dog = Dog.new
    @breeds = Breed.all
  end

  def create
    @dog = Dog.new(dog_params)

    

    respond_to do |format|
      if @dog.save
        breed_ids = params[:dog][:breed_ids]
        
        # Working now!
        DogBreed.create(dog: @dog, breed_id: breed_ids)
      
        # Fetch an image from the API!
        require 'net/http'
        require 'json'


        image_url = URI.parse("https://dog.ceo/api/breed/#{@dog.breeds[0].name}/images/random")
        response = Net::HTTP.get(image_url)
        image_data = JSON.parse(response)
        actual_url = image_data["message"]
        @dog.dog_images.create(image_url: actual_url)


        # make a new connection on the breeds table
        
        format.html { redirect_to @dog, notice: "Dog was successfully created." }
        format.json { render :show, status: :created, location: @dog }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dog.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    
  end
  
  def destroy
    # Table join.
    @dog = Dog.includes(:dog_images, :dog_breeds).find(params[:id])

    @dog.dog_images.destroy_all
    @dog.dog_breeds.destroy_all
    @dog.destroy!

    respond_to do |format|
      format.html { redirect_to dogs_path, status: :see_other, notice: "Beer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dog
      @dog = Dog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dog_params
      params.require(:dog).permit(:name, :age, :gender, :description)
    end

end
