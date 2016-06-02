class Photo < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  attr_accessor :color

  validates_presence_of :creator_email, :image

  def image_cache_url
    "/uploads/tmp/#{self.image_cache}"
  end

end