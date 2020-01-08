FocusablePanel {
	Text {
		width: 100%;
		height: 100%;
		verticalAlignment: Text.AlignVCenter;
		horizontalAlignment: Text.AlignHCenter;
		text: model.title;
		color: colorTheme.accentTextColor;
		font.pixelSize: 27;
	}

	onClicked: { info.play() }
}
