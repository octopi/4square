require 'coffee-script'
request = require 'request'

module.exports = (client_id, client_secret) ->
	#ll, near, llAcc, alt, altAcc, query, limit, intent, radius, sw, ne, categoryId, url, providerId, linkedId 
	return { getVenues: (params) ->
		
		# Add parameters to query
		urlString = "https://api.foursquare.com/v2/venues/search?"
		urlString += "&ll=" + params.ll if params.ll?
		urlString += "&near=" + params.near if params.near?
		urlString += "&llAcc=" + params.llAcc if params.llAcc?
		urlString += "&alt=" + params.alt if params.alt?
		urlString += "&altAcc=" + params.altAcc if params.altAcc?
		urlString += "&ll=query" + params.query if params.query?
		urlString += "&limit=" + params.limit if params.limit?
		urlString += "&intent=" + params.intent if params.intent?
		urlString += "&radius=" + params.radius if params.radius?
		urlString += "&sw=" + params.sw if params.sw?
		urlString += "&ne=" + params.ne if params.ne?
		urlString += "&categoryId=" + params.categoryId if params.categoryId?
		urlString += "&url=" + params.url if params.url?
		urlString += "&providerId=" + params.prodividerId if params.providerId?
		urlString += "&linkedId=" + params.linkedId if params.linkedId?
		
		#Add tokens to query
		urlString += "&client_id=" + client_id if client_id? 
		urlString += "&client_secret=" + client_secret if client_secret? 
		
		#Add Date to query (4square standard)
		today = new Date()
		month = (today.getMonth() + 1)
		month = "0" + month if month < 10
		day = today.getDate()
		day = "0" + day if day < 10
		date = today.getFullYear() + month + day	
		urlString += "&v=" + date
		
		#HTTP Request to 4square
		request urlString, (error, response, body) ->
			JSON.parse(body) if !error && response.statusCode == 200


	}
	