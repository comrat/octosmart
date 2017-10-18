Rectangle {
	property bool dataReady;
	property bool emulatorReady;
	anchors.fill: context;
	color: "#000";

	PageStack {
		width: 100%;
		height: 100%;

		StartMenu {

		}

		Emulator {
			anchors.centerIn: parent;

			onReady: { this.parent.emulatorReady = true }
		}
	}

	Resource {
		id: resource;
		url: "examples/planet.8o";

		onDataChanged: {
			log("datachanged")
			this.parent.dataReady = true
			this.parent.rebuild()
		}
	}

	rebuild: {
		//TODO: get data from delected game
		/* if (this.dataReady && this.emulatorReady) */
		/* 	window.run(resource.data) */
	}
}
