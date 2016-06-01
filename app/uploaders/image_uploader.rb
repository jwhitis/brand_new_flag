# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  cloudinary_transformation transformation: [
    { width: 400, height: 400, crop: :fill },
    { overlay: "flag_overlay_green" }
  ]

  def extension_white_list
    %w(jpg jpeg gif png)
  end

end