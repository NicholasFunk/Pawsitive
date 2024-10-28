class Dog < ApplicationRecord

  has_many :dog_breeds
  has_many :breeds, through: :dog_breeds
  has_many :dog_images

  # Add validations
  validates :name, :age, :description, presence: true
end
