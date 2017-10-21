Item {
	width: 1280;
	height: 640;

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

	runImpl(data, options): { window.runWithOptions(resource.data, options) }

	onCompleted: { this.element.dom.setAttribute("id", "emulator") }
}
