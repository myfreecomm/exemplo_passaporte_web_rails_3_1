class User < ActiveRecord::Base
  devise :omniauthable, :token_authenticatable
  def self.find_for_passaporte_web_oauth(access_token, signed_in_resource=nil)
    uuid = access_token['uid']
    email = access_token['user_info']['email']
    user = User.find_by_uuid(uuid)
    user = User.find_by_email(email) unless user
    return unless user
    user.uuid = uuid
    user.email = email
    user.save
    user
  end
end
