Rectangle {
	signal close;
	property string hint;
	property string startKey;
	width: 100%;
	height: 100%;
	focus: true;

	Emulator {
		id: emulator;
		property bool loading;
		anchors.top: parent.top;
		anchors.horizontalCenter: parent.horizontalCenter;
		anchors.topMargin: (parent.height - height) / 2;
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

	Text {
		id: hintText;
		width: 100%;
		anchors.top: emulator.bottom;
		anchors.topMargin: 10;
		horizontalAlignment: Text.AlignHCenter;
		font.pixelSize: 24;
		color: colorTheme.textColor;
		visible: false;
	}

	EmulatorControls {
		id: controls;

		onClose: { this.parent.close() }
		onOpenHelp: { helpPage.show(this.parent._selectedApp.manual) }
		onShowGridChanged: { hintText.visible = false }
	}

	//TODO: maybe move it to controls?
	KeyList {
		id: keyList;
		y: 640;
		anchors.horizontalCenter: parent.horizontalCenter;
		visible: controls.showGrid;

		onKeepAlive: { controls.keepAlive() }
	}

	HelpPage { id: helpPage; }

	CssSpinner {
		/* running: emulator.loading; */
		anchors.centerIn: parent;
	}

	BlobLoader {
		id: resource;

		onLoaded(data): { emulator.run(data) }
	}

	onKeyPressed: {
		if (this.startKey && this.startKey == key || this.hint)
			hintText.visible = false
		return false
	}

	loadApp(app): {
		this._selectedApp = app
		controls.showGrid = false

		keyList.fill(app.options.keyMap)

		controls.showHelp = app.manual
		this.hint = app.hint
		this.startKey = app.startKey
		if (app.hint) {
			hintText.text = app.hint
			hintText.visible = true
		} else if (app.startKey) {
			var keyText = this._keyMap[app.startKey] ? this._keyMap[app.startKey] : app.startKey
			hintText.text = "Press '" + keyText + "' to start"
			hintText.visible = true
		} else {
			hintText.visible = false
		}

		if (resource.url == app.file)
			emulator.run(resource._data)
		else
			resource.url = app.file
	}

	onBackPressed: {
		this.close()
		return true
	}

	onRecursiveVisibleChanged: {
		if (!value)
			keyList.model.clear()
	}

	onCompleted: {
		this._keyMap = {
			'Select': "OK",
			'Right': "Right",
			'Left': "Left",
			'Down': "Down",
			'Up': "Up"
		}
		this.element.dom.setAttribute("id", "emulatorBackground")
	}
}
