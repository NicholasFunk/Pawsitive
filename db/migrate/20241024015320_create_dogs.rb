class CreateDogs < ActiveRecord::Migration[7.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.integer :age
      t.string :gender
      t.string :breed
      t.text :description

      t.timestamps
    end
  end
end
