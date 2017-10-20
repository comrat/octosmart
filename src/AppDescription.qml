Column {
	width: 40%;
	spacing: 10;

	Image {
		id: screenshot;
		width: 100%;
	}

	Text {
		id: description;
		width: 100%;
		wrapMode: Text.WordWrap;
		font.pixelSize: 24;
		color: "#fff";
	}

	fill(data): {
		screenshot.source = data.screenshot
		description.text = data.description
	}
}
