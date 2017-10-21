Item {
	signal selected;
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
			border.width: activeFocus ? 2 : 0;
			border.color: "#ff83ff";

			FocusOnHoverMixin { }

			Text {
				width: 100%;
				height: 100%;
				verticalAlignment: Text.AlignVCenter;
				horizontalAlignment: Text.AlignHCenter;
				text: model.title;
				color: "#0ff";
				font.pixelSize: 27;
			}
		}

		chooseCurrent: { info.fill(this.model.get(this.currentIndex)) }

		onCurrentIndexChanged: { this.chooseCurrent() }
		onActiveFocusChanged: { if (value) this.chooseCurrent() }
		onSelectPressed: { this.parent.selected(this.model.get(this.currentIndex)) }
	}

	AppDescription {
		id: info;
		x: 50%;
		y: 20%;
	}

	onActiveFocusChanged: { if (value) gameList.setFocus() }

	onCompleted: {
		var data = [
			{
				"title" : "Planet of the Eights",
				"description" : "The last 32-bit register is trying to survive on the terrible planet of the Eights using air balloon.",
				"screenshot": "examples/planet_of_the_eights/planet.png",
				"file": "examples/planet_of_the_eights/planet.8o",
				"options": {
					"tickrate": 200,
					"fillColor": "#FF00FF",
					"fillColor2": "#00FFFF",
					"blendColor": "#000000",
					"backgroundColor": "#00FFFF",
					"buzzColor": "#990099",
					"quietColor": "#330033",
					"shiftQuirks": false,
					"loadStoreQuirks": false,
					"vfOrderQuirks": false,
					"clipQuirks": false,
					"jumpQuirks": false,
					"screenRotation": false,
					"enableXO": false
				}
			}, {
				"title" : "Kesha was bird",
				"description" : "This game contains your daily doze of chill and no action at all. Written for CHIP8, stunningly beautiful in its 4-colour palette. Adding in a bit of gore with fine finish of 1-pixel erotic.",
				"screenshot": "examples/kesha_was_bird/logo.png",
				"file": "examples/kesha_was_bird/kesha1.8o",
				"options": {
					//TODO: fill actual values
					"tickrate": 1000,
					"fillColor": "#000000",
					"fillColor2": "#000000",
					"blendColor": "#000000",
					"backgroundColor": "#000000",
					"buzzColor": "#000000",
					"quietColor": "#000000",
					"shiftQuirks": false,
					"loadStoreQuirks": false,
					"vfOrderQuirks": false,
					"clipQuirks": false,
					"jumpQuirks": false,
					"screenRotation": false,
					"enableXO": true
				}
			}, {
				"title" : "Kesha was biird",
				"description" : "You may want to play the first part to have better understanding what's going on there. Or not.",
				"screenshot": "examples/kesha_was_biird/logo.png",
				"file": "examples/kesha_was_biird/kesha2.8o",
				"options": {
					"tickrate": 1000,
					"fillColor": "#000000",
					"fillColor2": "#000000",
					"blendColor": "#000000",
					"backgroundColor": "#000000",
					"buzzColor": "#000000",
					"quietColor": "#000000",
					"shiftQuirks": false,
					"loadStoreQuirks": false,
					"vfOrderQuirks": false,
					"clipQuirks": false,
					"jumpQuirks": false,
					"screenRotation": false,
					"enableXO": true
				}
			}
		]

		gameList.model.clear()
		gameList.model.append(data)
	}
}
