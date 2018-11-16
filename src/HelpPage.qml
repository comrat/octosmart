Rectangle {
	width: 100%;
	height: 100%;
	border.width: 2;
	color: colorTheme.backgroundColor;
	visible: false;

	Text {
		id: helpViewText;
		x: 5%;
		y: 10%;
		width: 90%;
		height: 90%;
		font.pixelSize: 32;
		horizontalAlignment: Text.AlignHCenter;
		color: "#fff";
		text: "";
	}

	OctoButton {
		id: closeButton;
		y: 90%;
		width: 150;
		height: 50;
		anchors.horizontalCenter: parent.horizontalCenter;
		focus: parent.visible;
		text: "Close";

		onPressed: { this.parent.hide() }
		onBackPressed: { this.parent.hide() }
	}

	show(text): {
		this.visible = true
		helpViewText.text = text
		closeButton.setFocus()
	}

	hide: {
		this.visible = false
	}
}
