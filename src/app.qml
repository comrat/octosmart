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
				emulator.loadApp(app)
			}
		}

		Item {
			width: 100%;
			height: 100%;

			Emulator {
				id: emulator;
				anchors.top: parent.top;
				anchors.horizontalCenter: parent.horizontalCenter;
				anchors.topMargin: 40;

				run(data): { this.runImpl(data, this._selectedApp.options) }

				loadApp(app): {
					resource.url = app.file
					this._selectedApp = app
				}
			}

			KeyGrid {
				y: 540;
				anchors.horizontalCenter: parent.horizontalCenter;
			}
		}
	}

	Resource {
		id: resource;

		onDataChanged: { emulator.run(value) }
	}
}
