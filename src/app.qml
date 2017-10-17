Rectangle {
	property bool dataReady;
	property bool emulatorReady;
	anchors.fill: context;
	color: "#000";

	Emulator {
		anchors.centerIn: parent;

		onReady: {
			this.parent.emulatorReady = true
			this.parent.rebuild()
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
		if (this.dataReady && this.emulatorReady)
			window.run(resource.data)
	}
}
