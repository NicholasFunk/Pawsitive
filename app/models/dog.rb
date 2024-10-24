class Dog < ApplicationRecord

  has_many :dog_breeds
  has_many :breeds, through: :dog_breeds

  # Add validations
end
