class CreateDogs < ActiveRecord::Migration[7.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
