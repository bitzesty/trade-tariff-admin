class ApplicationController < ActionController::Base
  include Pundit
  include GDS::SSO::ControllerMethods

  protect_from_forgery

  prepend_before_filter :authenticate_user!
  before_filter :require_signin_permission!

  rescue_from Pundit::NotAuthorizedError do |e|
    # Layout and view comes from GDS::SSO::ControllerMethods
    render "authorisations/unauthorised", layout: "unauthorised", status: :forbidden, locals: { message: e.message }
  end unless Rails.env.test?
end
