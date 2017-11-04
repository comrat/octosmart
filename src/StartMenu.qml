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
		x: 3;
		y: 20%;
		width: 10%;
		height: 80%;
		focus: true;
		model: ListModel {
			ListElement { menu: "games"; icon: "games.png"; }
			ListElement { menu: "settings"; icon: "settings.png"; }
			ListElement { menu: "help"; icon: "acknowledge.png"; }
		}
		delegate: WebItem {
			width: 100%;
			height: width;
			border.width: activeFocus ? 2 : 0;
			border.color: colorTheme.accentPanelColor;

			ImageMixin {
				x: 15%;
				y: 15%;
				width: 70%;
				height: 70%;
				source: "res/menu/" + (parent.focused ? "active_" : "") + model.icon;
			}
		}

		onCurrentIndexChanged: { appPages.currentIndex = value }

		onRightPressed: { gamesPage.setFocus() }
	}

	PageStack {
		id: appPages;
		x: 10%;
		y: 20%;
		width: 80%;
		height: 80%;

		GamesPage {
			id: gamesPage;
			y: 2;
			x: 2;

			onSelected(app): { startMenuProto.selected(app) }
			onOpenHelp(manual): { menuHelpPage.show(manual) }
		}

		Item {
			y: 2;
			x: 2;
			width: 100%;
			height: 100%;
		}

		Item {
			y: 2;
			x: 2;
			width: 100%;
			height: 100%;
		}

		onLeftPressed: { menuList.setFocus() }
	}

	HelpPage { id: menuHelpPage; }

	onActiveFocusChanged: { if (value) gamesPage.setFocus() }
}
