class PhotosController < ApplicationController
  before_action :find_photos, except: :download
  before_action :initialize_photo, only: [:preview, :create]

  def index
    @photos = @photos.offset(params[:offset].to_i)
  end

  def preview
    if @photo.invalid?
      flash[:alert] = "Please enter your email address and pick a photo in one of these formats: #{extension_white_list}"
      render "home/index"
    end
  end

  def create
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

  def find_photos
    @photos = Photo.most_recent.per_request
  end

  def initialize_photo
    @photo = Photo.new(photo_params)
  end

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