Item {
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

	runImpl(data, options, complete): {
		var self = this
		window.runWithOptions(data, options, complete)
	}

	onCompleted: { this.element.dom.setAttribute("id", "emulator") }
}
