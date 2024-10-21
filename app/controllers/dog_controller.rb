class DogController < ApplicationController
    validates :name, length: { minimum: 2 }, :age, numericality: true, :description, presence: true
end
