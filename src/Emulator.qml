Item {
	property bool loading;
	width: height * 2;
	height: 512;

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

	Timer {
		id: delayTimer;
		interval: 500;

		run(data, options): {
			this._data = data
			this._options = options
			this.restart()
		}

		onTriggered: { this.parent.runImpl(this._data, this._options) }
	}

	doRun(data, options): {
		this.loading = true
		delayTimer.run(data, options)
	}

	runImpl(data, options): {
		var self = this
		window.runWithOptions(resource.data, options, function() { self.loading = false }.bind(this))
	}

	onCompleted: { this.element.dom.setAttribute("id", "emulator") }
}
