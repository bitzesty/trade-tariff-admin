class User < ActiveRecord::Base
  include GDS::SSO::User

  serialize :permissions

  module Permissions
    SIGNIN = 'signin'
    HMRC_EDITOR = 'HMRC Editor'
    GDS_EDITOR = 'GDS Editor'
  end

  def gds_editor?
    has_permission?(Permissions::GDS_EDITOR)
  end

  def hmrc_editor?
    has_permission?(Permissions::HMRC_EDITOR)
  end

  def to_s
    name
  end
end
