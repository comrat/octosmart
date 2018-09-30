Rectangle {
	anchors.fill: context;
	color: colorTheme.backgroundColor;

	ColorTheme { id: colorTheme; }

	Protocol { id: protocol; }

	PageStack {
		width: 100%;
		height: 100%;

		StartMenu {
			onSelected(app): {
				log("Run app", app.title)
				this.parent.currentIndex = 1
				emulatorPage.loadApp(app)
			}
		}

		EmulatorPage {
			id: emulatorPage;

			onClose: { this.parent.showMenu() }
			onBackPressed: { this.parent.showMenu() }
		}

		showMenu: { this.currentIndex = 0 }

		onBackPressed: { this.parent.closeApp() }
	}

	closeApp: {
		switch (_globals._context.system.os) {
			case 'tizen': window.tizen.application.getCurrentApplication().exit(); break
			case 'webOS': window.webOS.platformBack(); break
			case 'netcast': window.NetCastBack(); break
			case 'android': navigator.app.exitApp(); break
			default: log("Connot close app on", _globals._context.system.os); break
		}
	}
}
