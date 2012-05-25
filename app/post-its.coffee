PostIts = new Meteor.Collection("post_its")

if Meteor.is_client
  Template.post_its.post_its = PostIts.find()
  
  Template.post_its_pad.events =
    'click .post-it.pad': (e)->
      new_post_it = {text: "Hello", left:900, top:700}
      PostIts.insert new_post_it

  Template.post_it_note.events =
    'mouseover .post-it.note': (e)->
      unless $(e.target).hasClass('draggable') or !$(e.target).hasClass('note')
        $(e.target).draggable()
        
    'mouseup .post-it.note': (e)->
      return unless $(e.target).hasClass('note')
      offset = $(e.target).position()
      @left = offset.left
      @top = offset.top
      @angle = (Math.random() * 10) - 5
      PostIts.update this._id, this
    
    'keyup .post-it.note textarea': (e)->
      this.text = $(e.target).val()
      PostIts.update this._id, this
      
    'click .post-it.note .delete': (e)-> PostIts.remove(this)
    