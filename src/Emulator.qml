Item {
	signal ready;
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

	onCompleted: {
		/* var canvas = this._context.createElement('canvas') */
		/* canvas.dom.setAttribute("style", "position: absolute; visibility: inherit;") */
		/* canvas.dom.setAttribute("id", "target") */
		/* canvas.dom.setAttribute("width", "100%") */
		/* canvas.dom.setAttribute("height", "100%") */
		/* console.log("CAN", canvas) */

		/* var divElement = this._context.createElement('div') */
		/* divElement.dom.setAttribute("width", "100%") */
		/* divElement.dom.setAttribute("height", "100%") */
		/* divElement.append(canvas) */

		this.element.dom.setAttribute("id", "emulator")
		/* this.element.append(divElement) */
		/* this.element.append(canvas) */
		this.ready()
	}
}
