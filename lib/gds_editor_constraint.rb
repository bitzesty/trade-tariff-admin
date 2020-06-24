class GdsEditorConstraint
  attr_reader :request

  def matches?(request)
    return true if Rails.env.development?
    @request = request
    warden.authenticate!
    current_user && current_user.gds_editor?
  end

  private

  def warden
    request.env['warden']
  end

  def current_user
    warden.user if user_signed_in?
  end

  def user_signed_in?
    warden && warden.authenticated? && ! warden.user.remotely_signed_out?
  end
end
