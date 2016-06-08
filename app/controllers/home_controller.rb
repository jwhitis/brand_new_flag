class HomeController < ApplicationController

  def index
    @photo = Photo.new
    @photos = Photo.gallery.most_recent.per_request
  end

end