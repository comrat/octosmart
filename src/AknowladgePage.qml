Column {
	width: 100%;
	height: 100%;
	spacing: 10;

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
		text: "Thank to <b>JohnEarnest</b> for 'Octo' project (chip8 js emulator)<br><br>Thank to all chip8 programmers:<br>";
	}

	ListView {
		x: 30%;
		width: 50%;
		height: contentHeight;
		model: ListModel {
			ListElement { authors: "AKouZ1"; game: "2048-Game"; }
			ListElement { authors: "Tann"; game: "Civiliz8n"; }
			ListElement { authors: "SysL"; game: "DVN8"; }
			ListElement { authors: "whoozle, gazay"; game: "Kesha was bird"; }
			ListElement { authors: "whoozle, gazay"; game: "Kesha was biird"; }
			ListElement { authors: "whoozle, gazay"; game: "Kesha was ninja"; }
			ListElement { authors: "Mastigophoran"; game: "octopeg"; }
			ListElement { authors: "jackiekircher, Tann"; game: "Skyward"; }
			ListElement { authors: "your name here"; game: "t8nks"; }
		}
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
}
