Item {
	width: 100%;
	height: 100%;

	Image {
		y: 2.5%;
		anchors.horizontalCenter: parent.horizontalCenter;
		source: "res/logo.png";
	}

	ListView {
		id: gameList;
		x: 10%;
		y: 20%;
		width: 30%;
		height: 80%;
		model: ListModel { }
		delegate: WebItem {
			width: 100%;
			height: 50;
			color: activeFocus ? "#212121" : "#0000";

			FocusOnHoverMixin { }

			Text {
				x: 10;
				width: 100%;
				height: 100%;
				verticalAlignment: Text.AlignVCenter;
				text: model.title;
				color: "#0ff";
				font.pixelSize: 27;
			}
		}

		chooseCurrent: { info.fill(this.model.get(this.currentIndex)) }

		onActiveFocusChanged: { if (value) this.chooseCurrent() }
		onCurrentIndexChanged: { this.chooseCurrent() }
	}

	AppDescription {
		id: info;
		x: 50%;
		y: 20%;
	}

	onActiveFocusChanged: { if (value) gameList.setFocus() }

	onCompleted: {
		var data = [{
			"title" : "Planet of the Eights",
			"description" : "The last 32-bit register is trying to survive on the terrible planet of the Eights using air balloon.",
			"screenshot": "examples/planet_of_the_eights/planet.png",
			"file": "examples/planet_of_the_eights/planet.8o",
			"options": {
				//TODO: fill actual values
				"tickrate": 1000,
				"fillColor": "#000000",
				"fillColor2": "#000000",
				"blendColor": "#000000",
				"backgroundColor": "#000000",
				"buzzColor": "#000000",
				"quietColor": "#000000",
				/* "shiftQuirks": emulator.shiftQuirks, */
				/* "loadStoreQuirks": emulator.loadStoreQuirks, */
				/* "vfOrderQuirks": emulator.vfOrderQuirks, */
				/* "clipQuirks": emulator.clipQuirks, */
				/* "jumpQuirks": emulator.jumpQuirks, */
				/* "screenRotation": emulator.screenRotation, */
				"enableXO": false
			}
		}]

		gameList.model.clear()
		gameList.model.append(data)
	}
}
