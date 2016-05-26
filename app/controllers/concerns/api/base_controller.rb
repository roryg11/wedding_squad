class Api::BaseController < ApplicationController
  respond_to :json

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
    respond_with @current_user
  end

end
