# Get the complete list of breeds available from the API.

require 'net/http'
require 'json'

Dog.destroy_all
Breed.destroy_all
DogImage.destroy_all


# Fetch all dogs
url_dogs = URI.parse('https://dog.ceo/api/breeds/list/all')

response = Net::HTTP.get_response(url_dogs)

dogs_data = JSON.parse(response.body)

# Populate the data base with each breed individually.

dogs_data["message"].each do |breed|
#  puts "#{breed[0]}"
 Breed.create(name: breed[0])
end

# In our loop, we will need to fetch an image from the api.
random_breed = Breed.find(Breed.pluck(:id).sample)
puts random_breed.name
url_image = URI.parse("https://dog.ceo/api/breed/#{random_breed.name}/images/random")

response = Net::HTTP.get_response(url_image)
random_image = JSON.parse(response.body)
puts random_image

# Construct a fake dog using faker and the random breed and image.

dog_name = Faker::Creature::Dog.name
dog_age = Faker::Creature::Dog.age
dog_gender = Faker::Creature::Dog.gender
dog_description = "#{dog_name} is #{Faker::Adjective.positive} #{dog_age} year old #{dog_gender} that is looking for a loving home."

dog = Dog.create(name: dog_name, 
                 age: dog_age,
                 gender: dog_gender,
                 description: dog_description
                )

