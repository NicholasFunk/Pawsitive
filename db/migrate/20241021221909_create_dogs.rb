class CreateDogs < ActiveRecord::Migration[7.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :color
      t.decimal :age
      t.text :description

      t.timestamps
    end
  end
end
