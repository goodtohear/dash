YouTubeVideos = new Meteor.Collection("youtube")

Meteor.methods 
  update_youtube: ->
    for video in YouTubeVideos.find().fetch()
      if video.id?
        response = Meteor.http.get "https://gdata.youtube.com/feeds/api/videos/#{video.id}?v=2&alt=jsonc"
        if response.statusCode == 200
          YouTubeVideos.update video._id, JSON.parse(response.content).data
        else
          console.log "error fetching video id #{video.id}", video
    # YouTubeVideos.insert({id:"tJiWzZqvL0"})
    # 3M2f77wRFN0
    #http://www.youtube.com/watch?v=-tJiWzZqvL0
    
