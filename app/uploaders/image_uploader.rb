# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore.pluralize}/#{model.id}/#{mounted_as}"
  end

  version :square do
    process resize_to_fit: [400, 400]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end