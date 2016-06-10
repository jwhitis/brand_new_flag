class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_photos

  private

  def find_photos
    @photos = Photo.gallery.most_recent.per_request
  end

end
