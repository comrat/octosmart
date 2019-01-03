Column {
	width: 100%;
	height: 100%;
	spacing: 10;

	ListModel { id: aknowladgeModel; }

	Text {
		width: 100%;
		horizontalAlignment: Text.AlignHCenter;
		color: colorTheme.accentTextColor;
		font.pixelSize: 36;
		text: "CREDITS";
	}

	Text {
		id: creditText;
		width: 90%;
		anchors.horizontalCenter: parent.horizontalCenter;
		horizontalAlignment: Text.AlignHCenter;
		color: colorTheme.accentTextColor;
		font.pixelSize: 28;
		text: "Thank to <b>JohnEarnest</b> for 'Octo' project (chip8 envoirement)<br>Thank to whoozle for performance optimization<br><br>Thank to all chip8 programmers:<br>";
	}

	ListView {
		x: 30%;
		width: 50%;
		height: contentHeight;
		model: aknowladgeModel;
		delegate: Item {
			width: 100%;
			height: gameText.height;

			Text {
				id: gameText;
				font.pixelSize: 24;
				text: model.game;
				color: colorTheme.textColor;
			}

			Text {
				x: 50%;
				font.pixelSize: 24;
				text: model.authors;
				color: colorTheme.textColor;
			}
		}
	}

	onCompleted:{
		aknowladgeModel.clear()
		var protocol = this._context._local.protocol
		protocol.getGames(function(data) {
			var games = data.games
			var result = []
			for (var i in games)
				result.push({ authors: games[i].authors, game: games[i].title })
			aknowladgeModel.append(result)
		})
	}
}
