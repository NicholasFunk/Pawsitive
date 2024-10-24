# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Fetch json from the Book API for book names and cover images.

# API URL: https://mtgjson.com/data-models/card/card-set/

require 'net/http'
require 'json'

# # Fetch all dogs
url_dogs = URI.parse('https://dog.ceo/api/breeds/list/all')
response = Net::HTTP.get_response(url_dogs)
data = JSON.parse(response.body)

# t.string "name"
# t.string "gender"
# t.string "coat_length"
# t.string "size"
# t.decimal "age"
# t.text "description"

# We need to add a breed id once we create the breeds table.

data.each do |breed|
    dog = Dog.new(name: Faker::Creature::Dog.name, 
                  gender: Faker::Creature::Dog.gender, 
                  coat_length: Faker::Creature::Dog.coat_length, 
                  size: Faker::Creature::Dog.size, 
                  age: Faker::Creature::Dog.age,
                  description: Faker::Creature::Dog.)
end

# # Fetch an image of that dog
# breed = "affenpinscher"
# url_image = URI.parse("https://dog.ceo/api/breed/#{breed}/images/random")

# # Generate some fake data about dogs

# # Dog Adoption Website

# # Generate random dogs with images and profiles using the dog api and faker.

# response = Net::HTTP.get_response(url_dogs)
# dogs = JSON.parse(response.body)

# response = Net::HTTP.get_response(url_image)
# image = JSON.parse(response.body)

# puts dogs
# puts
# puts image