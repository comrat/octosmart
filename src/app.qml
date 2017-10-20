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
				resource.url = app.file
			}
		}

		Emulator {
			id: emulator;
			anchors.centerIn: parent;

			onReady: { this.parent.emulatorReady = true }
		}
	}

	Resource {
		id: resource;

		onDataChanged: { emulator.run(value) }
	}
}
