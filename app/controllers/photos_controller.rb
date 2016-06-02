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
      @photos = @photos.where.not(id: @photo.id)
      render :share
    else
      flash[:alert] = "Oops! Something went wrong. Please try again."
      render "home/index"
    end
  end

  def download
    @photo = Photo.find(params[:id])
    data = open(@photo.image_url)
    send_data data.read, filename: filename
  end

  private

  def photo_params
    params.require(:photo).permit(:creator_email, :image, :image_cache, :color)
  end

  def extension_white_list
    @photo.image.extension_white_list.map(&:upcase).join(", ")
  end

  def filename
    timestamp = Time.now.to_s(:number)
    extension = @photo.image.format
    "brand_new_flag_#{timestamp}.#{extension}"
  end

end