class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :database_authenticatable, :recoverable, :rememberable,
  # :registerable, :validatable,
  devise :trackable, :omniauthable, :omniauth_providers => [:twitter]

  def self.from_omniauth(auth)
    u = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = auth.info.nickname
    end
    u.update_attributes(username: auth.info.nickname,
                        oauth_token: auth.credentials.token,
                        oauth_secret: auth.credentials.secret)
  end
end
