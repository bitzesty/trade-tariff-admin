class User < ApplicationRecord
  include GDS::SSO::User

  serialize :permissions

  module Permissions
    SIGNIN = 'signin'.freeze
    HMRC_EDITOR = 'HMRC Editor'.freeze
    GDS_EDITOR = 'GDS Editor'.freeze
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
