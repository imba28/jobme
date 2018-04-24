class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password, :on => :create
  validates_uniqueness_of :name, :email, :on => :create

  def self.find_or_create_with_omniauth auth
    user = User.find_or_create_by!(
        provider: auth['provider'],
        uid: auth['uid'],
        password: SecureRandom.urlsafe_base64

    )
    user.name = auth.info.nickname
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
