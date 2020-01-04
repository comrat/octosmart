WebItem {
	width: 100%;
	height: width;
	border.width: activeFocus ? 2 : 0;
	border.color: colorTheme.accentPanelColor;
	border.type: Border.Outer;
	color: focused ? colorTheme.panelColor : "#0000";
	opacity: focused ? 1.0 : 0.5;

	FocusOnHoverMixin { }

	Image {
		x: 15%;
		y: 15%;
		width: 70%;
		height: 70%;
		source: "res/menu/" + (parent.focused ? "active_" : "") + model.icon;
	}
}
