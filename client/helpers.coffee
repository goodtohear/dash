# HELPER
helper = 
  format: (num) -> num.toString().replace(/\B(?=(?:\d{3})+(?!\d))/g, ",")
  
# COMMON
for template in ["youtube_video","soundcloud","issue","google_analytics"]
  Template[template].sparklinify = -> Meteor.defer -> $('.sparkline').sparkline()
  Template[template].masonry= -> Meteor.defer -> $('section#panels').masonry(itemSelector:".panel", columnWidth:128)
