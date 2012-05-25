
# Trying it out on the server.

SoundCloudFetches = new Meteor.Collection("soundcloud")

Meteor.methods 
  update_soundcloud: ->
    response = Meteor.http.get "http://api.soundcloud.com/users/michaelforrest.json", params:{client_id:Keys.soundcloud.client_id}
    # response = eval response.content
    data =  JSON.parse response.content
    data.created_at = new Date()
    already_got = SoundCloudFetches.findOne({}, sort:{created_at:-1})?.followers_count == data.followers_count
    unless already_got
      console.log "inserting"
      SoundCloudFetches.insert data 
    else
      console.log "Skipping this fetch"
