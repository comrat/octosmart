Column {
	id: appDescriptionProto;
	signal play;
	spacing: 10;

	Image {
		id: screenshot;
		width: 100%;
		height: width / 2;
	}

	Row {
		width: 100%;
		height: 50;
		spacing: 10;
		keyNavigationWraps: false;

		OctoButton {
			id: playButton;
			width: manualButton.visible ? (parent.width - parent.spacing) / 2 : parent.width;
			text: "Play";
			focus: true;

			onPressed: { appDescriptionProto.play() }
		}

		OctoButton {
			id: manualButton;
			width: (parent.width - parent.spacing) / 2;
			text: "Manual";
			focus: true;

			onPressed: { appDescriptionProto.showHelpPage() }
		}
	}

	Row {
		width: 100%;
		height: 27;
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
		font.pixelSize: 21;
		color: colorTheme.passiveTextColor;
	}

	onActiveFocusChanged: { if (value) playButton.setFocus() }

	fill(data): {
		screenshot.source = data.screenshot
		description.text = data.description
		manualButton.visible = data.manual

		var authors = data.authors
		var authorsString = ""
		for (var i = 0; i < authors.length; ++i)
			authorsString += authors[i] + ", "

		if (authorsString)
			authorsString = authorsString.slice(0, -2)
		createdText.text = authorsString
	}
}
