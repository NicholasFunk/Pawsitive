class CreateDogs < ActiveRecord::Migration[7.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.text :description

      t.references :breed, null: false, foreign_key: true
      t.references :dog_image, null: false, foreign_key: true

      t.timestamps
    end
  end
end
