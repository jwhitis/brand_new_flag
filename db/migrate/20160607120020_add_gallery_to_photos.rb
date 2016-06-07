class AddGalleryToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :gallery, :boolean, default: true, null: false
  end
end
