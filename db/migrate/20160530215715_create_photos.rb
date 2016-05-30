class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :creator_email, null: false
      t.string :image, null: false

      t.timestamps null: false
    end
  end
end
