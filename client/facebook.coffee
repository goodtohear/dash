
Template.facebook.likes = -> Session.get('facebook')?.likes

Meteor.http.get "https://graph.facebook.com/271169146296740", (error,response)->
  Session.set('facebook', JSON.parse response.content)