class AddDogsRefToImages < ActiveRecord::Migration[7.2]
  def change
    add_reference :dog_images, :dog, null: false, foreign_key: true
  end
end
