class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password

  has_and_belongs_to_many :jobs

  def self.find_or_create_with_omniauth auth
    user = User.find_or_create_by!(
        provider: auth['provider'],
        uid: auth['uid']
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
