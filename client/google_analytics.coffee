  
# GOOGLE ANALYTICS
# This is not pretty. My apologies. Especially with all the d3 stuff mixed in.. 
# I need to work out the load sequence with the whole api client callback from the header and then I will know where to put everything!
  
window.on_gapi_load = ->
  gapi.client.setApiKey Keys.google_analytics.api_key

  GTH_ACCOUNT_ID = "27485311"
  GTH_WEB_PROPERTY_ID = "UA-27485311-1"
  GTH_SITE_PROFILE_ID = "53583532"
  
  
  gapi.client.load 'analytics', 'v3', ->  
    gapi.auth.authorize {
      client_id: Keys.google_analytics.client_id
      scope: "https://www.googleapis.com/auth/analytics.readonly"
      immediate: true
    }, ->
      gapi.client.analytics.management.webproperties.list(accountId: GTH_ACCOUNT_ID).execute (results)->
        console.log "properties list", results
      gapi.client.analytics.management.profiles.list(accountId: GTH_ACCOUNT_ID, webPropertyId:GTH_WEB_PROPERTY_ID).execute (results)->
        console.log "profiles list", results
      query = gapi.client.analytics.data.ga.get 
        'ids': "ga:#{GTH_SITE_PROFILE_ID}" 
        'start-date': '2012-04-01'
        'end-date': '2012-05-16'
        'metrics': 'ga:visits'
        'dimensions': 'ga:date'
        # 'sort': '-ga:visits,ga:source'
        'max-results': 90 # days
    
      query.execute (result)-> 
        data = result.rows
        values = _.map data, ([date,value])->parseInt(value)

        # range bands
        width = 212
        height = 100
        x = d3.scale.ordinal()
          .domain(values)
          .rangeBands([0,width])
        y = d3.scale.linear().domain([0, d3.max values]).range([0, height])
        
        # chart creation
        chart = d3.select('.google-analytics.panel .visits').append('svg')
          .attr('class','time-series')
          .attr('width', width)
          .attr('height', height)
        
        chart.selectAll("rect")
          .data(values)
          .enter().append("rect")
          .attr("x", x)
          .attr("y", (d) -> height - y(d) )
          .attr("height", y)
          .attr("width", x.rangeBand())
        $('.google-analytics.panel .total strong').text d3.sum(values)
  