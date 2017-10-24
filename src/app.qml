Rectangle {
	anchors.fill: context;
	color: "#000";

	Rectangle {
		width: 1280;
		height: 720;
		border.color: "#f00";
		border.width:2;
	}

	PageStack {
		width: 100%;
		height: 100%;

		StartMenu {
			onSelected(app): {
				log("Run app", app.title)
				this.parent.currentIndex = 1
				emulatorPage.loadApp(app)
			}
		}

		EmulatorPage { id: emulatorPage; }
	}
}
