Rectangle {
	anchors.fill: context;
	color: colorTheme.backgroundColor;

	ColorTheme { id: colorTheme; }

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

		EmulatorPage {
			id: emulatorPage;

			onClose: { this.parent.showMenu() }
			onBackPressed: { this.parent.showMenu() }
		}

		showMenu: { this.currentIndex = 0 }
	}
}
