Column {
	width: 100%;
	height: 100%;

	Text {
		width: 100%;
		horizontalAlignment: Text.AlignHCenter;
		text: "CONTROLS";
		color: colorTheme.accentTextColor;
		font.pixelSize: 32;
	}

	ListView {
		width: 10%;
		height: 40%;
		anchors.horizontalCenter: parent.horizontalCenter;
		focus: false;
		model: ListModel {
			ListElement { text: "W"; icon: "res/keys/up.png"; }
			ListElement { text: "A"; icon: "res/keys/left.png"; }
			ListElement { text: "D"; icon: "res/keys/right.png"; }
			ListElement { text: "V"; valueText: "OK (toggle buttons)"; }
		}
		delegate: Item {
			width: 100%;
			height: 15%;

			Text {
				id: keyText;
				width: parent.parent.width / 2;
				color: colorTheme.textColor;
				wrapMode: Text.WordWrap;
				font.pixelSize: 32;
				text: model.text;
			}

			Image {
				x: keyText.width + 10;
				width: height;
				height: keyText.height;
				source: model.icon;
				fillMode: Image.PreserveAspectFit;
				visible: model.icon;
				radius: width / 2;
			}

			Text {
				x: keyText.width + 20;
				height: keyText.height;
				visible: model.valueText;
				text: model.valueText;
				color: colorTheme.textColor;
				font.pixelSize: 32;
			}
		}
	}
}
