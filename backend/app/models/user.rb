class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password, :on => :create
  validates_uniqueness_of :name, :email, :on => :create  
  
  def self.find_or_create_with_omniauth auth
    if(!User.find_by(uid: auth['uid']))
      user = User.create({
        uid: auth['uid'],
        provider: auth['provider'],
        name: auth.info.name,
        email: auth.info.email,
        avatar_url: auth.info.image,
        password: auth.credentials.token,
        password_confirmation: auth.credentials.token
      })
      user
    else 
      user = User.find_by(
        provider: auth['provider'],
        uid: auth['uid']
      )
      user
    end
  end

  def to_s
    username = "#{uid}@#{provider}"
    if name
      username = name
    end
    username
  end
end
