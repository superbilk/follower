class TwitterAccount < ActiveRecord::Base
  self.primary_key = 'id'

  def self.create_or_update(attributes)
    twitter_account = TwitterAccount.where(id: attributes.uid).first_or_create do |account|
      # create basic account
      account.assign_attributes(screen_name: attributes.extra.raw_info.screen_name,
                                name: attributes.extra.raw_info.name,
                                image_https: attributes.extra.raw_info.profile_image_url_https,
                                twitter_url: attributes.info.urls.Twitter
                                )
    end
    twitter_account.assign_attributes(screen_name: attributes.extra.raw_info.screen_name,
                                      name: attributes.extra.raw_info.name,
                                      image_https: attributes.extra.raw_info.profile_image_url_https,
                                      twitter_url: attributes.info.urls.Twitter,
                                      location: attributes.extra.raw_info.location,
                                      description: attributes.extra.raw_info.description,
                                      website: attributes.extra.raw_info.url,
                                      followers_count: attributes.extra.raw_info.followers_count,
                                      friends_count: attributes.extra.raw_info.friends_count
                                      )
    if twitter_account.changed?
      twitter_account.save
    else
      twitter_account.touch
    end
  end
end
