class ApplicationController < ActionController::Base
  include GDS::SSO::ControllerMethods

  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :require_signin_permission!
end
