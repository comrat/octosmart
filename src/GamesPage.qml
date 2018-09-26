Item {
	id: gamesPageProto;
	signal selected;
	signal openHelp;
	width: 100%;
	height: 100%;
	focus: true;

	ListView {
		id: gameList;
		x: 4;
		width: 45%;
		height: 100%;
		positionMode: ListView.Center;
		keyNavigationWraps: false;
		focus: true;
		model: ListModel { }
		delegate: WebItem {
			width: 100%;
			height: 50;
			border.width: activeFocus ? 2 : 0;
			border.color: colorTheme.accentPanelColor;
			border.type: Border.Outer;

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

			onClicked: { info.play() }
		}

		updateCurrentAppInfo: {
			if (this.currentIndex >= 0 && this.currentIndex < this.count)
				info.fill(this.model.get(this.currentIndex))
		}

		select(idx): { gamesPageProto.selected(this.model.get(idx)) }

		onCountChanged: { if (value) this.updateCurrentAppInfo() }
		onRightPressed: { info.setFocus() }
		onSelectPressed: { info.setFocus() }
		onCurrentIndexChanged: { this.updateCurrentAppInfo() }
	}

	AppDescription {
		id: info;
		x: 50%;
		width: 40%;
		height: 100%;

		onPlay: { gameList.select(gameList.currentIndex) }
		onOpenHelp: { gamesPageProto.openHelp(gameList.model.get(gameList.currentIndex).manual) }
		onLeftPressed: { gameList.setFocus() }
	}

	onActiveFocusChanged: { if (value) gameList.setFocus() }

	onCompleted: {
		var data = [
			{
				"title" : "2048-Game",
				"description" : "2048 game which based on its original game.",
				"screenshot": "examples/2048/logo.png",
				"file": "examples/2048/output.ch8",
				"manual": "manuals.Manual2048",
				"authors": ["AKouZ1"],
				"startKey": "Select",
				"options": {
					"keyMap": {
						'Select': '0', // x (0)
						'Up': '5', // w (5)
						'Left': '7', // a (7)
						'Down': '8', // s (8)
						'Right': '9' // d (9)
					},
					"tickrate": 200,
					"fillColor": "#4080ff",
					"fillColor2": "#FF6600",
					"blendColor": "#662200",
					"backgroundColor": "#081020",
					"buzzColor": "#FFAA00",
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
				"title" : "Civiliz8n",
				"description" : "Score as many points as you can in 10 turns. Each turn: Place one of the three random tiles adjacent to the last tile placed. Send score pictures to tann@threechoicegames.com",
				"screenshot": "examples/civiliz8n/logo.png",
				"file": "examples/civiliz8n/output.ch8",
				"manual": "manuals.CivManual",
				"authors": ["Tann"],
				"hint": "Press '1' - '4' remote key to choose game mode",
				"options": {
					"keyMap": {
						'1': '1', // 1 (1)
						'2': '2', // 2 (2)
						'3': '3', // 3 (3)
						'Red': '4', // q (4)
						'Green': '6', // e (6)
						'Up': '5', // w (5)
						'Left': '7', // a (7)
						'Down': '8', // s (8)
						'Right': '9', // d (9)
						'4': 'c' // 4 (C)
					},
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
				"title" : "DVN8",
				"description" : "Play the game with the text!<br><span style='color: #0ff;'>https://systemlogoff.com/share/DVN8/index.html</span><br>The location of all the text the 'read ##' tells you about, with the game in a handy frame for ease of use. Remember to click the game between reads!",
				"screenshot": "examples/dvn8/logo.png",
				"file": "examples/dvn8/output.ch8",
				"authors": ["SysL"],
				"manual": "manuals.DvnManual",
				"options": {
					"keyMap": {
						'Select': '2', // 2 (2)
						'Up': '5', // w (5)
						'Left': '7', // a (7)
						'Down': '8', // s (8)
						'Right': '9' // d (9)
					},
					"tickrate": 20,
					"fillColor": "#1f1f1f",
					"fillColor2": "#000000",
					"blendColor": "#000000",
					"backgroundColor": "#f0f0f0",
					"buzzColor": "#aa2222",
					"quietColor": "#000000",
					"shiftQuirks": false,
					"loadStoreQuirks": true,
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
				"file": "examples/kesha_was_bird/kesha1.bin",
				"authors": ["whoozle", "gazay"],
				"manual": "manuals.KeshaManual",
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
						'9': '9' // d (9)
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
				"manual": "manuals.KeshaManual",
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
						'9': '9' // d (9)
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
				"title" : "Kesha was ninja",
				"description" : "Legendary ninja returns! Who is he? Ruthless killer? Absolute evil? Character with his own purpose? His motives are still unclear, and his story is for you to unfold.",
				"screenshot": "examples/kesha_was_ninja/logo.png",
				"file": "examples/kesha_was_ninja/output.ch8",
				"authors": ["whoozle", "gazay"],
				"manual": "manuals.KeshaWasNinjaManual",
				"options": {
					"keyMap": {
						'Up': '5', // w (5)
						'Left': '7', // a (7)
						'Down': '8', // s (8)
						'Right': '9', // d (9)
						'Select': 'f'  // v (F)
					},
					"tickrate": 1000,
					"fillColor": "#b22d10",
					"fillColor2": "#10b258",
					"blendColor": "#ffffff",
					"backgroundColor": "#283593",
					"buzzColor": "#182583",
					"quietColor": "#182583",
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
				"hint": "Press any remote key to start",
				"manual": "manuals.OctopegManual",
				"options": {
					"keyMap": {
						'Select': '6', // e (6)
						'Up': '5', // w (5)
						'Down': '8', // s (8)
						'Left': '7', // a (7)
						'Right': '9' // d (9)
					},
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
				"startKey": "Down",
				"manual": "manuals.PlanetManual",
				"options": {
					"keyMap": {
						'Up': '5', // w (5)
						'Left': '7', // a (7)
						'Down': '8', // s (8)
						'Right': '9', // d (9)
						'Select': 'd' // r (D)
					},
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
				"manual": "manuals.SkywardManual",
				"authors": ["jackiekircher", "Tann"],
				"startKey": "1",
				"options": {
					"keyMap": {
						'1': '1', // 1 (1)
						'Up': '5', // w (5)
						'Left': '7', // a (7)
						'Down': '8', // s (8)
						'Right': '9' // d (9)
					},
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
				"hint": "Press any remote key to start",
				"manual": "manuals.T8nksManual",
				"options": {
					"keyMap": {
						'Select': '6', // e (6)
						'Up': '5', // w (5)
						'Left': '7', // a (7)
						'Down': '8', // s (8)
						'Right': '9', // d (9)
						'1': '1', // 1 (1)
						'2': '2', // 2 (2)
						'3': '3' // 3 (3)
					},
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
