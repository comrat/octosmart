CommonDelegate {
	signal pressed;
	property string text;

	Text {
		width: 100%;
		height: 100%;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		text: parent.text;
		color: colorTheme.accentTextColor;
		font.pixelSize: 27;
	}

	onClicked: { this.pressed() }
	onSelectPressed: { this.pressed() }
}
