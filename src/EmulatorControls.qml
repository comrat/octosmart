WebItem {
	id: emulatorControlsProto;
	signal close;
	property bool show;
	property bool showGrid;
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

			onClicked: { emulatorControlsProto.close() }
		}

		WebItem {
			width: 50;
			height: 50;

			ImageMixin { source: "res/controls/" + (emulatorControlsProto.showGrid ? "no_grid.png" : "grid.png"); }

			onClicked: {
				emulatorControlsProto.showGrid = !emulatorControlsProto.showGrid
				emulatorControlsProto.keepAlive()
			}
		}
	}

	MouseMoveMixin { onMouseMove: { emulatorControlsProto.show = true } }

	Timer {
		id: showTimer;
		interval: 5000;

		onTriggered: { this.parent.show = false }
	}

	keepAlive: { showTimer.restart() }

	onShowChanged: { if (value) this.keepAlive() }
}
