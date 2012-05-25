Keys = {}

if Meteor.is_server
  Keys.soundcloud =
    client_id: "9eaa4d5759367740a6a13115ef1ec44e"

  Keys.github =
    # get a token with 
    # curl -u "user:password" https://api.github.com/authorizations\?client_id\=your_client_id\&scope\=user,repo
    token: "b1d9ca8dbd1584c0a38a182daf91a70c46d9b7ed" 
    
if Meteor.is_client
  Keys.google_analytics =
    client_id: "242804522291.apps.googleusercontent.com"
    api_key: "AIzaSyAvUmxLZ6XeXFQjIQwRX_tigG4RkCcRUQU"