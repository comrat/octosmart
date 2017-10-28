Item {
	signal close;
	width: 100%;
	height: 100%;

	Emulator {
		id: emulator;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.topMargin: 10;

		run(data): { this.doRun(data, this.parent._selectedApp.options) }
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

	CssSpinner {
		running: emulator.loading;
		anchors.centerIn: parent;
	}

	BlobLoader {
		id: resource;

		onLoaded(data): { emulator.run(data) }
	}

	loadApp(app): {
		resource.url = app.file
		this._selectedApp = app
	}
}
