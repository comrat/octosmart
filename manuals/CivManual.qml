Column {
	width: 100%;
	height: 100%;

	Text {
		width: 100%;
		horizontalAlignment: Text.AlignHCenter;
		text: "CONTROLS";
		color: colorTheme.accentTextColor;
	}

	ListView {
		width: 10%;
		height: 40%;
		anchors.horizontalCenter: parent.horizontalCenter;
		focus: false;
		model: ListModel {
			ListElement { text: "W"; icon: "res/keys/up.png"; }
			ListElement { text: "A"; icon: "res/keys/left.png"; }
			ListElement { text: "S"; icon: "res/keys/down.png"; }
			ListElement { text: "D"; icon: "res/keys/right.png"; }
			ListElement { text: "Q"; color: "red"; }
			ListElement { text: "E"; color: "green"; }
		}
		delegate: Item {
			width: 100%;
			height: 15%;

			Row {
				height: 100%;
				anchors.horizontalCenter: parent.horizontalCenter;
				spacing: 40;

				Text {
					id: keyText;
					width: parent.parent.width / 2;
					color: colorTheme.textColor;
					wrapMode: Text.WordWrap;
					font.pixelSize: 32;
					text: model.text;
				}

				Image {
					width: height;
					height: keyText.height;
					source: model.icon;
					fillMode: Image.PreserveAspectFit;
					visible: model.icon;
					radius: width / 2;
				}

				Item {
					width: height;
					height: keyText.height;
					visible: model.color;

					Rectangle {
						width: 80%;
						height: 80%;
						anchors.centerIn: parent;
						color: model.color;
						radius: width / 2;
					}
				}
			}
		}
	}

	Text {
		width: 100%;
		horizontalAlignment: Text.AlignHCenter;
		text: "TILES";
		color: colorTheme.accentTextColor;
	}

	ListView {
		id: tileView;
		width: 65%;
		height: 50%;
		focus: false;
		anchors.horizontalCenter: parent.horizontalCenter;
		model: ListModel {
			ListElement {
				title: "Hut: +1 point";
				text: "Place another bonus hut!";
				tile: "examples/civiliz8n/help/hutborder.png";
			}

			ListElement {
				title: "Garden: +2 points";
				text: "If in a connected group of exactly 3 gardens, +4 points instead";
				tile: "examples/civiliz8n/help/gardenborder.png";
			}

			ListElement {
				title: "Meeting circle: +1 point";
				text: "When you completely surround this tile, +5 more points";
				tile: "examples/civiliz8n/help/meetingborder.png";
			}

			ListElement {
				title: "Shrine: +5 points";
				text: "Only if >2 hexes away from all other shrines.";
				tile: "examples/civiliz8n/help/shrineborder.png";
			}

			ListElement {
				title: "Temple: +1 point per different adjacent tile";
				text: "Other temples don't count due to religious competition by-laws.";
				tile: "examples/civiliz8n/help/templeborder.png";
			}

			ListElement {
				title: "Forester: +1 point";
				text: "Cuts down all adjacent trees for +1 point each.";
				tile: "examples/civiliz8n/help/loggerborder.png";
			}

			ListElement {
				title: "Trees:";
				text: "Randomly placed at the start. Must cut them down with a forester in order to put tiles on top.";
				tile: "examples/civiliz8n/help/treesborder.png";
			}
		}
		delegate: Item {
			width: 100%;
			height: 15%;

			Image {
				width: parent.height;
				source: model.tile;
				fillMode: Image.PreserveAspectFit;
			}

			Text {
				x: parent.height + 10;
				text: model.title;
				color: colorTheme.accentTextColor;
			}

			Text {
				x: parent.height + 10;
				y: 32%;
				width: parent.width - x;
				color: colorTheme.textColor;
				text: model.text;
				wrapMode: Text.WordWrap;
			}
		}
	}
}
