class Dog < ApplicationRecord
    validates :name, :age, :gender, presence: true
    validates :name, length: { minimum: 2 }
    validates :age, numericality: true
end
