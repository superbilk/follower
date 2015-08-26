class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :database_authenticatable, :recoverable, :rememberable,
  # :registerable, :validatable,
  devise :trackable, :omniauthable, :omniauth_providers => [:twitter]

  attr_readonly :twitter

  def self.from_omniauth(auth)
    u = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.username = auth.info.nickname
    end
    u.assign_attributes(username: auth.info.nickname,
                        oauth_token: auth.credentials.token,
                        oauth_secret: auth.credentials.secret)
    u.save if u.changed?
    TwitterAccount.create_or_update(auth)
    return u
  end

  def twitter
    @twitter ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_API_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_API_SECRET']
      config.access_token        = self.oauth_token
      config.access_token_secret = self.oauth_secret
    end
    @twitter
  end
end
