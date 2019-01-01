Rectangle {
	width: 100%;
	height: 100%;
	border.width: 2;
	color: colorTheme.backgroundColor;
	visible: false;

	Item {
		id: detailedContainer;
		x: 5%;
		y: 5%;
		width: 90%;
		height: 80%;
		clip: true;

		Text {
			id: helpViewText;
			property int shift;
			anchors.left: parent.left;
			anchors.right: parent.right;
			transform.translateY: shift;
			horizontalAlignment: Text.AlignHCenter;
			font.pixelSize: 32;
			color: "#fff";
			wrapMode: Text.WordWrap;

			Behavior on transform { Animation { duration: 200; easing: "ease-out"; } }
		}
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

	moveUp: {
		if (helpViewText.height > detailedContainer.height)
			helpViewText.shift = helpViewText.shift + 50 < 0 ? helpViewText.shift + 50 : 0
	}

	moveDown: {
		if (helpViewText.height > detailedContainer.height)
			helpViewText.shift = helpViewText.shift - 50 > detailedContainer.height / 2 - helpViewText.height ? helpViewText.shift - 50 : (detailedContainer.height / 2 - helpViewText.height)
	}

	onUpPressed: { this.moveUp() }
	onDownPressed: { this.moveDown() }
}
