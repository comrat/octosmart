Item {
	signal close;
	width: 100%;
	height: 100%;

	Emulator {
		id: emulator;
		property bool loading;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.topMargin: !controls.showGrid ? (parent.height - height) / 2 : 10;
		visible: !loading;

		run(data): {
			var self = this
			this.loading = true
			this.runImpl(data, this.parent._selectedApp.options, function () { self.loading = false })
		}

		onCompleted: {
			this.style("will-change", "transform")
			this.style("transform", "translateZ(0)")
		}
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
		/* running: emulator.loading; */
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
