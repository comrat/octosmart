Item {
	property bool loading;
	width: 960;
	height: 480;

	Item {
		width: 100%;
		height: 100%;

		Canvas {
			width: 100%;
			height: 100%;

			onCompleted: { this.element.dom.setAttribute("id", "target") }
		}

		onCompleted: { this.element.dom.className = "canv" }
	}

	runImpl(data, options): {
		var self = this
		this.loading = true
		window.runWithOptions(resource.data, options, function() { self.loading = false }.bind(this))
	}

	onCompleted: { this.element.dom.setAttribute("id", "emulator") }
}
