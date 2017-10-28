Request {
	property string url;
	signal loaded;
	signal error;

	function load(url) {
		if (url) {
			var self = this
			var request = new XMLHttpRequest();
			request.responseType = "blob";
			request.onload = function(res) {
				var blob = new Blob([res.target.response], {type: "application/octet-stream"});
				var arrayBuffer;
				var fileReader = new FileReader();
				var selfContext = self
				fileReader.onload = function() {
					var buff = fileReader.result;
					var bytes = new Uint8Array(buff);
					log("BYTES", bytes)
					selfContext.loaded(bytes)
				};
				fileReader.readAsArrayBuffer(res.target.response);
			}
			request.open("GET", url);
			request.send();
		} else {
			this.data = ''
		}
	}

	onUrlChanged:	{ this.load(value) }
	onCompleted:	{ this.load(this.url) }
}
