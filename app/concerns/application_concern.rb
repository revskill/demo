module ApplicationConcern
  extend ActiveSupport::Concern

  included do 
    before_filter :set_locale
    protect_from_forgery
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url
    end
  end
end