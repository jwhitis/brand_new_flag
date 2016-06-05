class HomeController < ApplicationController

  def index
    @photo = Photo.new
    @photos = Photo.most_recent.per_request
  end

end