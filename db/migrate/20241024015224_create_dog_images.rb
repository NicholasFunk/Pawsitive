class CreateDogImages < ActiveRecord::Migration[7.2]
  def change
    create_table :dog_images do |t|
      t.string :image_url

      t.timestamps
    end
  end
end
