Item {
	signal close;
	width: 100%;
	height: 100%;

	Emulator {
		id: emulator;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.topMargin: 40;

		run(data): { this.runImpl(data, this.parent._selectedApp.options) }
	}

	EmulatorControls {
		id: controls;

		onClose: { this.parent.close() }
	}

	KeyGrid {
		y: 540;
		anchors.horizontalCenter: parent.horizontalCenter;
		visible: controls.showGrid;
	}

	Spinner { running: emulator.loading; }

	Resource {
		id: resource;

		onDataChanged: { emulator.run(value) }
	}

	loadApp(app): {
		resource.url = app.file
		this._selectedApp = app
	}
}
