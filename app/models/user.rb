class User < Sequel::Model
  include GDS::SSO::User

  def update_attribute(attribute, value)
    update({ attribute => value })
  end
end
