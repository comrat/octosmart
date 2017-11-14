ListView {
	/* width: (40 + spacing) * 4; */
	width: contentWidth;
	height: 40;
	spacing: 2;
	orientation: ListView.Horizontal;
	delegate: KeyButton { }
	model: ListModel { }

	fill(data): {
		this.model.clear()
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
