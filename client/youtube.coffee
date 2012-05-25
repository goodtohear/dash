# YOUTUBE
YouTubeVideos = new Meteor.Collection("youtube")
Template.youtube = _.extend Template.youtube,
  videos: -> YouTubeVideos.find()

Template.youtube_video = _.extend Template.youtube_video,
  title: -> 
    truncate = 70
    @title?[0..truncate] + (if @title?.length >= truncate then "..." else '')
  thumbnail_url: -> if @thumbnail? then @thumbnail.sqDefault else @id
  viewCount: -> helper.format @viewCount

Meteor.call 'update_youtube'  
