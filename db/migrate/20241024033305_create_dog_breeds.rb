class CreateDogBreeds < ActiveRecord::Migration[7.2]
  def change
    create_table :dog_breeds do |t|
      t.references :dog, null: false, foreign_key: true
      t.references :breed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
