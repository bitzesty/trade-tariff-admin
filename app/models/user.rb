class User
  include GDS::SSO::User

  def self.find_by_uid(uid)
    find(uid: uid)
  end

  def remotely_signed_out?
    remotely_signed_out
  end

  def update_attribute(attribute, value)
    update({ attribute => value })
  end
end
