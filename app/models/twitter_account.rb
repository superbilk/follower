class TwitterAccount < ActiveRecord::Base
  self.primary_key = 'id'

  def self.create_or_update(attributes)
    twitter_account = TwitterAccount.where(id: attributes.id).first_or_create do |account|
      account.assign_attributes(screen_name: attributes.screen_name,
                                name: attributes.name,
                                image_https: attributes.profile_image_uri_https,
                                twitter_url: attributes.uri,
                                location: attributes.location,
                                description: attributes.description,
                                website: attributes.website,
                                followers_count: attributes.followers_count,
                                friends_count: attributes.friends_count
      )
    end
    if twitter_account.changed?
      twitter_account.save
    else
      twitter_account.touch
    end
  end
end
