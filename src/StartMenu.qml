Item {
	id: startMenuProto;
	signal selected;
	width: 100%;
	height: 100%;

	Rectangle {
		x: 0;
		y: 0;
		width: 100%;
		height: appPages.y;
		color: colorTheme.panelColor;
	}

	Image {
		y: 2.5%;
		anchors.horizontalCenter: parent.horizontalCenter;
		source: "res/logo.png";
	}

	Rectangle {
		anchors.top: appPages.top;
		anchors.left: appPages.left;
		anchors.right: parent.right;
		anchors.bottom: parent.bottom;
		color: colorTheme.panelColor;
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

			onOpenHelp(app): {
				var protocol = this._context._local.protocol
				protocol.getManual(app, function(manual) {
					menuHelpPage.show(manual)
				})
			}
		}

		AknowladgePage {
			y: 2;
			x: 2;
		}

		onLeftPressed: { menuList.setFocus() }
	}

	ListView {
		id: menuList;
		x: 3;
		y: 20%;
		width: 10%;
		height: 80%;
		keyNavigationWraps: false;
		focus: true;
		delegate: MenuDelegate { }
		model: ListModel {
			ListElement { menu: "games"; icon: "games.png"; }
			ListElement { menu: "help"; icon: "acknowledge.png"; }
		}

		onCurrentIndexChanged: { appPages.currentIndex = value }

		onRightPressed: {
			if (appPages.children[appPages.currentIndex].focus)
				appPages.setFocus()
		}
	}

	HelpPage { id: menuHelpPage; }

	onActiveFocusChanged: { if (value) gamesPage.setFocus() }
}
