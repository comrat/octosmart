Rectangle {
	anchors.fill: context;
	color: "#000";

	PageStack {
		width: 100%;
		height: 100%;

		StartMenu {
			onSelected(app): {
				log("Run app", app.title)
				this.parent.currentIndex = 1
				emulator.loadApp(app)
			}
		}

		Emulator {
			id: emulator;
			anchors.centerIn: parent;

			run(data): { this.runImpl(data, this._selectedApp.options) }

			loadApp(app): {
				resource.url = app.file
				this._selectedApp = app
			}
		}
	}

	Resource {
		id: resource;

		onDataChanged: { emulator.run(value) }
	}
}
