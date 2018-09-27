Request {
	signal error;
	property string baseUrl: "http://aapobeis.beget.tech";

	getGames(callback): {
		this.call("/games", callback)
	}

	call(name, callback, error, method, data): {
		this.callImpl(this.baseUrl + name, callback, error, method, data)
	}

	callImpl(name, callback, error, method, data): {
		var headers = { "Accept-Language": this.acceptLanguage || "en" }
		if (data)
			headers["Content-Type"] = "application/json"

		var url = name
		var self = this

		this.ajax({
			method: method || "GET",
			headers: headers,
			contentType: 'application/json',
			url: url,
			data: data,
			done: function(res) {
				self.failCount = 0
				if (error && res.target && res.target.status >= 400) {
					log("Error in callback", res)
					error(res)
					return
				}

				var text = res.target.responseText
				if (!text) {
					callback("")
					return
				}
				var res
				try {
					res = JSON.parse(text)
				} catch (e) {
					res = text
				}
				callback(res)
			},
			error: function(res) {
				if (error)
					error(res)
				else
					self.error({"url": url, "method": method, "response": res})
				self.checkNetwork(url, method, res)
			}
		})
	}
}
