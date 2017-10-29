Item {
	id: startMenuProto;
	signal selected;
	width: 100%;
	height: 100%;

	Image {
		y: 2.5%;
		anchors.horizontalCenter: parent.horizontalCenter;
		source: "res/logo.png";
	}

	ListView {
		id: menuList;
		y: 20%;
		width: 30%;
		height: 80%;
		model: ListModel {
			ListElement { menu: "games"; icon: "res/menu/games.png"; }
			ListElement { menu: "settings"; icon: "res/menu/settings.png"; }
			ListElement { menu: "help"; icon: "res/menu/help.png"; }
		}
		delegate: WebItem {
			width: 100%;
			height: 50;
			border.width: activeFocus ? 2 : 0;
			border.color: colorTheme.accentPanelColor;

			ImageMixin {
				width: 100%;
				height: 100%;
				source: model.icon;
			}
		}
	}

	PageStack {
		x: 10%;
		y: 17%;
		width: 80%;
		height: 80%;
		clip: false;

		Item {
			width: 100%;
			height: 100%;

			ListView {
				id: gameList;
				width: 45%;
				height: 80%;
				model: ListModel { }
				delegate: WebItem {
					width: 100%;
					height: 50;
					border.width: activeFocus ? 2 : 0;
					border.color: colorTheme.accentPanelColor;

					FocusOnHoverMixin { }

					Text {
						width: 100%;
						height: 100%;
						verticalAlignment: Text.AlignVCenter;
						horizontalAlignment: Text.AlignHCenter;
						text: model.title;
						color: colorTheme.accentTextColor;
						font.pixelSize: 27;
					}

					onClicked: { this.parent.select(this._local.model.index) }
				}

				select(idx): { startMenuProto.selected(this.model.get(idx)) }
				updateCurrentAppInfo: { info.fill(this.model.get(this.currentIndex)) }

				onCurrentIndexChanged: { this.updateCurrentAppInfo() }
				onActiveFocusChanged: { if (value) this.updateCurrentAppInfo() }
				onSelectPressed: { this.select(this.currentIndex) }
			}

			AppDescription {
				id: info;
				x: 50%;
				width: 40%;
				height: 100%;
			}
		}
	}

	onActiveFocusChanged: { if (value) gameList.setFocus() }

	onCompleted: {
		var data = [
			{
				"title" : "8ce 8ttorny Disk 1",
				"description" : "The most expensive CHIP8 game made, taking up multiple game 'disks' to tell the story of the Lawyer Bell defending a courtroom janitor from murder charges.",
				"screenshot": "examples/8ce_8ttorny_disc1/logo.png",
				"file": "examples/8ce_8ttorny_disc1/output.ch8",
				"authors": ["SysL"],
				"options": {
					"tickrate": 1000,
					"fillColor": "#f1f1f1",
					"fillColor2": "#000000",
					"blendColor": "#000000",
					"backgroundColor": "#0f0f0f",
					"buzzColor": "#aaff55",
					"quietColor": "#777777",
					"shiftQuirks": false,
					"loadStoreQuirks": false,
					"vfOrderQuirks": false,
					"clipQuirks": false,
					"jumpQuirks": false,
					"screenRotation": false,
					"enableXO": false
				}
			}, {
				"title" : "8ce 8ttorny Disk 2",
				"description" : "The most expensive CHIP8 game made, taking up multiple game 'disks' to tell the story of the Lawyer Bell defending a courtroom janitor from murder charges.",
				"screenshot": "examples/8ce_8ttorny_disc2/logo.png",
				"file": "examples/8ce_8ttorny_disc2/output.ch8",
				"authors": ["SysL"],
				"options": {
					"tickrate": 1000,
					"fillColor": "#f1f1f1",
					"fillColor2": "#000000",
					"blendColor": "#000000",
					"backgroundColor": "#0f0f0f",
					"buzzColor": "#aaff55",
					"quietColor": "#777777",
					"shiftQuirks": false,
					"loadStoreQuirks": false,
					"vfOrderQuirks": false,
					"clipQuirks": false,
					"jumpQuirks": false,
					"screenRotation": false,
					"enableXO": false
				}
			}, {
				"title" : "8ce 8ttorny Disk 3",
				"description" : "The most expensive CHIP8 game made, taking up multiple game 'disks' to tell the story of the Lawyer Bell defending a courtroom janitor from murder charges.",
				"screenshot": "examples/8ce_8ttorny_disc3/logo.png",
				"file": "examples/8ce_8ttorny_disc3/output.ch8",
				"authors": ["SysL"],
				"options": {
					"tickrate": 1000,
					"fillColor": "#f1f1f1",
					"fillColor2": "#000000",
					"blendColor": "#000000",
					"backgroundColor": "#0f0f0f",
					"buzzColor": "#aaff55",
					"quietColor": "#777777",
					"shiftQuirks": false,
					"loadStoreQuirks": false,
					"vfOrderQuirks": false,
					"clipQuirks": false,
					"jumpQuirks": false,
					"screenRotation": false,
					"enableXO": false
				}
			}, {
				"title" : "Civiliz8n",
				"description" : "Score as many points as you can in 10 turns. Each turn: Place one of the three random tiles adjacent to the last tile placed.",
				"screenshot": "examples/civiliz8n/logo.png",
				"file": "examples/civiliz8n/output.ch8",
				"manual": "manuals.CivManual",
				"authors": ["Tann"],
				"options": {
					"tickrate": 100,
					"fillColor": "#754D27",
					"fillColor2": "#738C3A",
					"blendColor": "#E2CB8A",
					"backgroundColor": "#141421",
					"buzzColor": "#284720",
					"quietColor": "#91742b",
					"shiftQuirks": false,
					"loadStoreQuirks": true,
					"vfOrderQuirks": false,
					"clipQuirks": false,
					"jumpQuirks": false,
					"screenRotation": false,
					"enableXO": true
				}
			}, {
				"title" : "Kesha was bird",
				"description" : "This game contains your daily doze of chill and no action at all. Written for CHIP8, stunningly beautiful in its 4-colour palette. Adding in a bit of gore with fine finish of 1-pixel erotic.",
				"screenshot": "examples/kesha_was_bird/logo.png",
				"file": "examples/kesha_was_bird/kesha1.bin",
				"authors": ["whoozle", "gazay"],
				"options": {
					"keyMap": {
						'0': '0', // x (0)
						'1': '1', // 1 (1)
						'2': '2', // 2 (2)
						'3': '3', // 3 (3)
						'4': '4', // q (4)
						'5': '5', // w (5)
						'6': '6', // e (6)
						'7': '7', // a (7)
						'8': '8', // s (8)
						'9': '9', // d (9)
						'Red': 'a', // z (A)
						'Green': 'b', // c (B)
						'Yellow': 'c', // 4 (C)
						'Blue': 'd', // r (D)
						'e': 'e', // f (E)
						'f': 'f'  // v (F)
					},
					"tickrate": 1000,
					"fillColor": "#B8CD9E",
					"fillColor2": "#ED656B",
					"blendColor": "#55989E",
					"backgroundColor": "#59755E",
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
				"file": "examples/kesha_was_biird/kesha2.bin",
				"authors": ["whoozle", "gazay"],
				"options": {
					"keyMap": {
						'0': '0', // x (0)
						'1': '1', // 1 (1)
						'2': '2', // 2 (2)
						'3': '3', // 3 (3)
						'4': '4', // q (4)
						'5': '5', // w (5)
						'6': '6', // e (6)
						'7': '7', // a (7)
						'8': '8', // s (8)
						'9': '9', // d (9)
						'Red': 'a', // z (A)
						'Green': 'b', // c (B)
						'Yellow': 'c', // 4 (C)
						'Blue': 'd', // r (D)
						'e': 'e', // f (E)
						'f': 'f'  // v (F)
					},
					"tickrate": 1000,
					"fillColor": "#1a1c19",
					"fillColor2": "#a0a29f",
					"blendColor": "#5d5b5d",
					"backgroundColor": "#fafdf9",
					"buzzColor": "#222211",
					"quietColor": "#212110",
					"shiftQuirks": false,
					"loadStoreQuirks": false,
					"vfOrderQuirks": false,
					"clipQuirks": false,
					"jumpQuirks": false,
					"screenRotation": false,
					"enableXO": true
				}
			}, {
				"title" : "octopeg",
				"description" : "You start each level with a number of shots. You can see these in the top left corner. You will get fewer shots as the game progresses. When you run out of shots, you will progress to the next level. There are 8 levels. It is not possible to lose.",
				"screenshot": "examples/octopeg/logo.png",
				"file": "examples/octopeg/output.ch8",
				"authors": ["Mastigophoran"],
				"options": {
					"tickrate": 200,
					"fillColor": "#acd5ff",
					"fillColor2": "#000000",
					"blendColor": "#000000",
					"backgroundColor": "#113152",
					"buzzColor": "#264c74",
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
				"title" : "Planet of the Eights",
				"description" : "The last 32-bit register is trying to survive on the terrible planet of the Eights using air balloon.",
				"screenshot": "examples/planet_of_the_eights/planet.png",
				"file": "examples/planet_of_the_eights/planet.ch8",
				"authors": ["comrat"],
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
				"title" : "Skyward",
				"description" : "All of her life Amy has lived in the darkness, in the safety of the caverns her village has called home. Legends tell of a crystal above that will grant anyone a single wish, but no one has seen the sky in the generations. Enraptured by these tales, she packs for a journey to see for herself if these stories are true. Armed with only a few spears and rations for the climb, she sets off skyward to create a legend of her own...",
				"screenshot": "examples/skyward/logo.png",
				"file": "examples/skyward/output.ch8",
				"authors": ["jackiekircher", "Tann"],
				"options": {
					"tickrate": 1000,
					"fillColor": "#4b636f",
					"fillColor2": "#af2d3d",
					"blendColor": "#af2d3d",
					"backgroundColor": "#121212",
					"buzzColor": "#000000",
					"quietColor": "#000000",
					"shiftQuirks": false,
					"loadStoreQuirks": true,
					"vfOrderQuirks": false,
					"clipQuirks": false,
					"jumpQuirks": false,
					"screenRotation": false,
					"enableXO": true
				}
			}, {
				"title" : "t8nks",
				"description" : "In Campaign mode, you play for a high score. You have limited ammo, and 3 lives. How far can you get?<br>Free Play: When you first select Free Play mode, you are presented with the ability to select a map. You have 99 of each type of ammo, so go hog wild. Maps are unlocked by visiting them in either mode, so don't worry if you die. You can pick up where you left off.",
				"screenshot": "examples/t8nks/logo.png",
				"file": "examples/t8nks/output.ch8",
				"authors": ["your name here"],
				"options": {
					"tickrate": 1000,
					"fillColor": "#554422",
					"fillColor2": "#456543",
					"blendColor": "#EEEEFF",
					"backgroundColor": "#87CEEB",
					"buzzColor": "#FFFFFF",
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
