Column {
	width: 40%;
	spacing: 10;

	Image {
		id: screenshot;
		width: 100%;
		height: width / 2;
	}

	Row {
		width: 100%;
		height: 35;
		spacing: 10;

		Text {
			font.pixelSize: 24;
			text: "Created by:";
			color: colorTheme.accentTextColor;
			visible: createdText.text;
		}

		Text {
			id: createdText;
			property string authors;
			font.pixelSize: 24;
			text: authors;
			color: colorTheme.textColor;
		}
	}

	Text {
		id: description;
		width: 100%;
		wrapMode: Text.WordWrap;
		font.pixelSize: 24;
		color: colorTheme.passiveTextColor;
	}

	fill(data): {
		screenshot.source = data.screenshot
		description.text = data.description
		var authors = data.authors
		var authorsString = ""
		for (var i = 0; i < authors.length; ++i)
			authorsString += authors[i] + ", "

		if (authorsString)
			authorsString = authorsString.slice(0, -2)
		createdText.text = authorsString
	}
}
