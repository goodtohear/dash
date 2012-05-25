Meteor.methods
  reset: ->
    YouTubeVideos.remove({})
    #PostItNotes.remove({})
    for id in ["6S-5IPAyRzo","3M2f77wRFN0","-tJiWzZqvL0"]
      YouTubeVideos.insert({id:id})
    Meteor.call "update_youtube"
    AdHocPanels.insert({heading:"Ad hoc", total: 179, label:"things"})
    
      