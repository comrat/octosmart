Rectangle {
	width: 100%;
	height: 100%;
	border.width: 2;
	color: colorTheme.backgroundColor;
	visible: false;

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

	Loader {
		id: loader;
		x: 5%;
		y: 10%;
		width: 90%;
		height: 90%;
		clip: true;

		onLoaded: {
			if (this.item)
				this.anchors.fill = this.item
			this.anchors.top = this.parent.top;
			this.anchors.left = this.parent.left;
			this.anchors.right = this.parent.right;
		}
	}

	show(url): {
		log("Show help", url)
		this.visible = true
		loader.source = url
		closeButton.setFocus()
	}

	hide: {
		this.visible = false
	}
}
