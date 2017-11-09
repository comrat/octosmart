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
		width: 20%;
		height: 40%;
		anchors.horizontalCenter: parent.horizontalCenter;
		focus: false;
		model: ListModel {
			ListElement { icon: "res/keys/up.png"; valueText: "to aim up"; }
			ListElement { icon: "res/keys/left.png"; valueText: "to aim left"; }
			ListElement { icon: "res/keys/right.png"; valueText: "to aim right"; }
			ListElement { icon: "res/keys/down.png"; valueText: "to aim down"; }
			ListElement { text: "OK"; valueText: "to shoot"; }
			ListElement { text: "1 2 3"; valueText: "to select a weapon"; }
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
				visible: model.text;
			}

			Image {
				id: keyIcon;
				x: keyText.visible ? keyText.width + 10 : 0;
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
