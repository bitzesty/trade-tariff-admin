class User
  include GDS::SSO::User

  def name
    "name"
  end

  def email
    "user@example.com"
  end

  def permissions
  end

  def remotely_signed_out?
    false
  end

  def update_attribute(attribute, value)
    # noop
  end

  def self.first
    new
  end
end
