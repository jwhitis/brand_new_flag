class PhotosController < ApplicationController

  def create
    @photo = Photo.new(photo_params)

    if @photo.save
      redirect_to root_path, notice: "Your profile photo has been created!"
    else
      @photos = Photo.all
      flash[:alert] = "Please enter your email address and choose an image in one of these formats: #{extension_white_list}"
      render "home/index"
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:creator_email, :image)
  end

  def extension_white_list
    @photo.image.extension_white_list.map(&:upcase).join(", ")
  end

end