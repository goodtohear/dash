GitHubIssues = new Meteor.Collection("github-issues")

if Meteor.is_client
  # GITHUB
 
  Template.github = _.extend Template.github,
    issues: -> GitHubIssues.find()
    issues_label: -> if GitHubIssues.find().count() == 1 then "issue" else "issues" 
    total: -> GitHubIssues.find().count()
    should_show: -> !this.hidden
    
  
  Template.issue.body = -> @body?[0..120] + if @body?.length > 120 then "..." else ""
  
  Meteor.call 'update_github'

if Meteor.is_server
  USER = "goodtohear"
  REPO = "dash"
  Meteor.methods
    update_github: ->
      result = Meteor.http.get "https://api.github.com/repos/#{USER}/#{REPO}/issues?access_token=#{Keys.github.token}"
      issues = JSON.parse result.content
      for data in issues
        unless GitHubIssues.findOne({id: data.id})
          GitHubIssues.insert data
      console.log "How many issues?", GitHubIssues.find().count()
     