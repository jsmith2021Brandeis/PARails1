#Copied from March 12 Recitation COSI 166B
class ApplicationController < ActionController::Base
    include SessionsHelper
  before_action :logged_in_user, only: [:show]
  private
  def logged_in_user
      unless logged_in? 
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
  end
end
