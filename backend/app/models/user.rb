class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password, :on => :create
  validates_uniqueness_of :name, :email, :on => :create  
  
  def self.find_or_create_with_omniauth auth
    user = User.find_or_create_by!(
        provider: auth['provider'],
        uid: auth['uid']
    )
    user.name = auth.info.name
    user.password = auth['uid']
    user.password_confirmation = auth['uid']
    user.email = auth.info.email
    user.avatar_url = auth.info.image
    user.save

    user
  end

  def to_s
    username = "#{uid}@#{provider}"
    if name
      username = name
    end
    username
  end
end
