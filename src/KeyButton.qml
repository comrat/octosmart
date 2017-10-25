WebItem {
	property string key;
	width: 40;
	height: width;
	color: colorTheme.panelColor;
	border.color: colorTheme.accentPanelColor;
	border.width: hover ? 2 : 0;

	Text {
		width: 100%;
		height: 100%;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		text: parent.key;
		color: "#0ff";
		font.pixelSize: 25;
	}
}
