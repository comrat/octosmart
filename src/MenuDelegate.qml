CommonDelegate {
	height: width;
	color: focused ? colorTheme.panelColor : "#0000";
	opacity: focused ? 1.0 : 0.5;

	Image {
		x: 15%;
		y: 15%;
		width: 70%;
		height: 70%;
		source: "res/menu/" + (parent.focused ? "active_" : "") + model.icon;
	}
}
