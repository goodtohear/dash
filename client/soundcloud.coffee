# SOUNDCLOUD
SoundCloudFetches = new Meteor.Collection("soundcloud")
Template.soundcloud = _.extend Template.soundcloud, 
  latest: -> SoundCloudFetches.findOne {}, sort:{created_at:-1}  
  followers_count: -> Template.soundcloud.latest()?.followers_count
  followers: -> "follower#{ if Template.soundcloud.followers_count() == 1 then '' else 's'  }"
  date: -> Template.soundcloud.latest()?.created_at
  sparkline_data: -> _.map SoundCloudFetches.find().fetch(), (fetch)-> fetch.followers_count
Meteor.call 'update_soundcloud'
