Item {
	width: 100%;
	height: 100%;

	ListView {
		id: tileView;
		width: 100%;
		height: 100%;
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
			height: 10%;

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
				y: 30%;
				width: parent.width - x;
				color: colorTheme.textColor;
				text: model.text;
				wrapMode: Text.WordWrap;
			}
		}
	}
}
