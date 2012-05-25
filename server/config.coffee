console.log "loading keys"
# rename this to config.coffee before running the app
Keys =
  soundcloud: 
    client_id: "" # Get this from http://soundcloud.com/you/apps

  github:
    # get a token with 
    # curl -u "user:password" https://api.github.com/authorizations\?client_id\=your_client_id\&scope\=user,repo
    token: "" 
  
  google_analytics: # register here: https://code.google.com/apis/console/
    client_id: ""
    api_key: ""