Item {
	property bool running;
	width: 100%;
	height: 100%;
	visible: running;

	Text {
		width: 100%;
		height: 100%;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		color: colorTheme.textColor;
		text: "Loading...";
		font.pixelSize: 32;
	}

	onVisibleChanged: { this.style('display', value ? 'block' : 'none'); }
}
