class Dog < ApplicationRecord

  has_many :dog_breed
  has_many :breed, through :dog_breed

  # Add validations
end
