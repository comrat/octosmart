WebItem {
	width: parent.cellWidth;
	height: parent.cellHeight;
	color: colorTheme.panelColor;
	border.color: colorTheme.accentPanelColor;
	border.width: hover ? 2 : 0;

	Text {
		width: 100%;
		height: 100%;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		text: model.key;
		color: "#0ff";
		font.pixelSize: 25;
	}
}
