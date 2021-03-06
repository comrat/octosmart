Item {
	id: gamesPageProto;
	signal selected;
	signal openHelp;
	width: 100%;
	height: 100%;
	focus: true;

	ListView {
		id: gameList;
		x: 4;
		width: 45%;
		height: 100%;
		positionMode: ListView.Center;
		keyNavigationWraps: false;
		focus: true;
		model: ListModel { }
		delegate: GameRowDelegate { onClicked: { info.play() } }

		updateCurrentAppInfo: {
			if (this.currentIndex >= 0 && this.currentIndex < this.count)
				info.fill(this.model.get(this.currentIndex))
		}

		select(idx): { gamesPageProto.selected(this.model.get(idx)) }

		onCountChanged: { if (value) this.updateCurrentAppInfo() }
		onRightPressed: { info.setFocus() }
		onSelectPressed: { info.setFocus() }
		onCurrentIndexChanged: { this.updateCurrentAppInfo() }
	}

	AppDescription {
		id: info;
		x: 50%;
		width: 40%;
		height: 100%;

		onPlay: { gameList.select(gameList.currentIndex) }
		onOpenHelp: { gamesPageProto.openHelp(gameList.model.get(gameList.currentIndex).id) }
		onLeftPressed: { gameList.setFocus() }
	}

	onActiveFocusChanged: { if (value) gameList.setFocus() }

	onCompleted:{
		var protocol = this._context._local.protocol
		protocol.getGames(function(data) {
			var games = data.games
			var result = []
			for (var i in games) {
				games[i].screenshot = protocol.baseUrl + games[i].screenshot
				games[i].file = protocol.baseUrl + games[i].file
				games[i].id = i
				result.push(games[i])
			}
			gameList.model.clear()
			gameList.model.append(result)
		})
		gameList.setFocus()
	}
}
