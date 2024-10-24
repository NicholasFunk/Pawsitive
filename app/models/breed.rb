class Breed < ApplicationRecord
    has_many :dog_breed
    has_many :dogs, through :dog_breed
end
