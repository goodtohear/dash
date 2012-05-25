Keys = {}

if Meteor.is_server
  Keys.soundcloud =
    client_id: "" # Get this from http://soundcloud.com/you/apps

  Keys.github =
    # get a token with 
    # curl -u "user:password" https://api.github.com/authorizations\?client_id\=your_client_id\&scope\=user,repo
    token: "" 

if Meteor.is_client
  Keys.google_analytics =
    client_id: "" # register here: https://code.google.com/apis/console/
    api_key: ""