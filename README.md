Good To Hear Dashboard
=======================

A Meteor app
-------------

My first [Meteor](http://meteor.com) app.

I tried out a few different techniques here and I know it's not all perfect but as long as I can look at my numbers I don't mind for now... :)

[<img src="https://github.com/goodtohear/dash/raw/master/public/images/screenshot.png" width='600'/>](https://github.com/goodtohear/dash/raw/master/public/images/screenshot.png "Screenshot") 

Demo site
==========

[Click here for the demo site](http://goodtohear-dash-demo.meteor.com)

It's only really intended to work in WebKit browsers (Chrome, Safari etc...) and I made it 1024x768 because I wanted it to look good on my iPad. (Where the post-its don't drag-and-drop properly yet... :-/ )


Features / Tech
===============
This dashboard pulls in data from:

* Facebook
* Google Analytics
* Soundcloud
* Github
* YouTube

You can add post-its and drag them about - anybody else looking at the app will see these post-its. It's REAL TIME WHOAHHH!

I had a crack at using the [d3](http://d3js.org/) library to do a chart. Feel like I still have a lot to learn here...

This includes my own handwriting font. For free. Imagine that.

The patterns are from the wonderful [subtlepatterns.com](http://subtlepatterns.com).

The design is (*cough*) "inspired by" [ducksboard.com](http://ducksboard.com). Go and use their service if you don't want to have to be a developer to use this ;) 

Make it your own
============================
If you want to run this on your own machine. Do this:

1. Install meteor:
```
curl install.meteor.com | /bin/sh
```

2. Get the code (ideally from your own fork though):
```
git clone https://github.com/goodtohear/dash.git
```

3. Edit the API keys file*
```
cd dash
edit server/config.coffee
```

4. Run the app:
```
meteor
```

And you should see it running if you point your browser at `http://localhost:3000`

\* *Or remove any widgets you don't need by editing templates/dash.html*

About me
========
I am a developer and musician based in London, UK. I recently founded a company called [Good To Hear](http://goodtohear.co.uk) focused on developing an iOS App called [Happiness](http://goodtohear.co.uk) - a tool to record and explore the influences on your mood. I release a song every week on [SoundCloud](http://soundcloud.com/michaelforrest) as part of a project called [MF Tuesdays](http://soundcloud.com/michaelforrest/sets/tuesdays).