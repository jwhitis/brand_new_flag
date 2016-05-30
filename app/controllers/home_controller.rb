class HomeController < ApplicationController

  def index
    @photo = Photo.new
    @photos = Photo.all
  end

end