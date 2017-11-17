ListView {
	signal keepAlive;
	width: contentWidth;
	height: 40;
	spacing: 2;
	orientation: ListView.Horizontal;
	model: ListModel { }
	delegate: KeyButton {
		onMouseUp: {
			var row = this.parent.model.get(this._local.model.index)
			var emulatorKey = window.keymap[this.parent._emulatorKeys[row.code]]
			if (emulatorKey in window.emulator.keys)
				window.keyUp({ keyCode: emulatorKey });
		}

		onClicked: {
			var row = this.parent.model.get(this._local.model.index)
			var emulatorKey = window.keymap[this.parent._emulatorKeys[row.code]]
			window.keyDown({ keyCode: emulatorKey })
			this.parent.keepAlive()
		}
	}

	fill(data): {
		for (var i in data) {
			var row = this._keyMap[i] ? this._keyMap[i] : { }
			row.key = i
			row.code = data[i]
			this.model.append(row)
		}
	}

	onCompleted: {
		this._keyMap = {
			'Select': { 'text': 'OK' },
			'Up': { 'icon': 'res/keys/up.png' },
			'Down': { 'icon': 'res/keys/down.png' },
			'Left': { 'icon': 'res/keys/left.png' },
			'Right': { 'icon': 'res/keys/right.png' },
			'Red': { 'color': 'red' },
			'Green': { 'color': 'green' },
			'Yellow': { 'color': 'yellow' },
			'Blue': { 'color': 'blue' }
		}

		this._emulatorKeys = {
			"0": 0, // x
			"1": 1, // 1
			"2": 2, // 2
			"3": 3, // 3
			"4": 4, // q
			"5": 5, // w
			"6": 6, // e
			"7": 7, // a
			"8": 8, // s
			"9": 9, // d
			"A": 10, // z
			"B": 11, // c
			"C": 12, // 4
			"D": 13, // r
			"E": 14, // f
			"F": 15  // v
		}
	}
}
