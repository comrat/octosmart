ListView {
	width: contentWidth;
	height: 40;
	spacing: 2;
	orientation: ListView.Horizontal;
	model: ListModel { }
	delegate: KeyButton {
		onClicked: {
			var row = this.parent.model.get(this._local.model.index)
			var key = row.key
			var keyCode
			var codes = qml.core.keyCodes
			for (var i in qml.core.keyCodes) {
				if (codes[i] == key) {
					keyCode = i
					break
				}
			}
			var event = new KeyboardEvent("keydown", { bubbles : true });
			Object.defineProperty(event, 'keyCode', { get : function() { return keyCode; } })
			document.dispatchEvent(event);

			var upEvent = new KeyboardEvent("keyup", { bubbles : true });
			Object.defineProperty(upEvent, 'keyCode', { get : function() { return keyCode; } })
			document.dispatchEvent(upEvent);
		}
	}

	fill(data): {
		for (var i in data) {
			var row = this._keyMap[i] ? this._keyMap[i] : { }
			row.key = i
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
	}
}
