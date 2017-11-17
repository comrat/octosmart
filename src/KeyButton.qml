WebItem {
	signal mouseUp;
	signal mouseDown;
	width: 50;
	height: parent.height;
	color: colorTheme.panelColor;
	border.color: colorTheme.accentPanelColor;
	border.width: hover ? 2 : 0;

	Text {
		width: 100%;
		height: 100%;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		text: model.text ? model.text : model.key;
		color: "#0ff";
		font.pixelSize: 25;
		visible: !model.icon && !model.color;
	}

	Image {
		width: height;
		height: parent.height;
		anchors.centerIn: parent;
		source: model.icon ? model.icon : "";
		visible: model.icon;
	}

	Rectangle {
		width: height;
		height: parent.height - 10;
		anchors.centerIn: parent;
		color: model.color ? model.color : "#0000";
		visible: model.color;
		radius: width / 2;
	}

	onCompleted: {
		var self = this
		this.element.on('mouseup', function() { self.mouseUp() }.bind(this))
		this.element.on('mousedown', function() { self.mouseDown() }.bind(this))
	}
}
