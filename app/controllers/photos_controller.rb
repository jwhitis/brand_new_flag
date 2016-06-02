class PhotosController < ApplicationController

  def preview
    @photo = Photo.new(photo_params)
    @photos = Photo.all

    if @photo.invalid?
      flash[:alert] = "Please enter your email address and choose an image in one of these formats: #{extension_white_list}"
      render "home/index"
    end
  end

  def create
    @photo = Photo.new(photo_params)
    @photos = Photo.all

    if @photo.save
      render :share
    else
      flash[:alert] = "Oops! Something went wrong. Please try again."
      render "home/index"
    end
  end

  def download
    # Send data
  end

  private

  def photo_params
    params.require(:photo).permit(:creator_email, :image, :image_cache, :color)
  end

  def extension_white_list
    @photo.image.extension_white_list.map(&:upcase).join(", ")
  end

end