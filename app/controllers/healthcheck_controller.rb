class HealthcheckController < ActionController::Base
  def check
    User.first # test db connectivity
    render json: { git_sha1: CURRENT_RELEASE_SHA }
  end
end
