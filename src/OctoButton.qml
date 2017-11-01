WebItem {
	property string text;
	width: 100%;
	height: 50;
	border.width: activeFocus ? 2 : 0;
	border.color: colorTheme.accentPanelColor;
	color: activeFocus ? colorTheme.backgroundColor : colorTheme.panelColor;

	FocusOnHoverMixin { }

	Text {
		width: 100%;
		height: 100%;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		text: parent.text;
		color: colorTheme.accentTextColor;
		font.pixelSize: 27;
	}
}
