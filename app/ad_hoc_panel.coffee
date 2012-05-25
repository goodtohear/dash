AdHocPanels = new Meteor.Collection("ad-hoc-panels")

if Meteor.is_client
  Template.ad_hoc_panels.panels = -> AdHocPanels.find()
  