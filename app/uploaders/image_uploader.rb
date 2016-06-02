# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process :add_overlay

  def add_overlay
    {
      transformation: [
        { width: 400, height: 400, crop: :fill },
        { overlay: "overlay_#{model.color}" }
      ]
    }
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end