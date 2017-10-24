WebItem {
	id: emulatorControls;
	property bool show;
	width: 100%;
	height: 100%;

	Row {
		x: 20;
		y: 20;
		height: 50;
		visible: parent.show;
		spacing: 10;

		WebItem {
			width: 50;
			height: 50;

			ImageMixin { source: "res/controls/back.png"; }
		}

		WebItem {
			width: 50;
			height: 50;

			ImageMixin { source: "res/controls/grid.png"; }
		}
	}

	MouseMoveMixin { onMouseMove: { emulatorControls.show = true } }

	Timer {
		id: showTimer;
		interval: 5000;

		onTriggered: { this.parent.show = false }
	}

	onShowChanged: { if (value) showTimer.restart() }
}
