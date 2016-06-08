class Photo < ActiveRecord::Base
  PER_REQUEST = 10

  mount_uploader :image, ImageUploader

  attr_accessor :color

  validates_presence_of :creator_email, :image

  scope :gallery, -> { where(gallery: true) }
  scope :most_recent, -> { order(created_at: :desc) }
  scope :per_request, -> { limit(PER_REQUEST) }

  def image_cache_url
    "/uploads/tmp/#{self.image_cache}"
  end

end