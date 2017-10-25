GridView {
	width: (40 + spacing) * 4;
	height: width;
	cellWidth: 40;
	cellHeight: cellWidth;
	spacing: 2;
	delegate: KeyButton { }
	model: ListModel {
		ListElement { key: "1"; } ListElement { key: "2"; } ListElement { key: "3"; } ListElement { key: "C"; }
		ListElement { key: "4"; } ListElement { key: "5"; } ListElement { key: "6"; } ListElement { key: "D"; }
		ListElement { key: "7"; } ListElement { key: "8"; } ListElement { key: "9"; } ListElement { key: "E"; }
		ListElement { key: "A"; } ListElement { key: "0"; } ListElement { key: "B"; } ListElement { key: "F"; }
	}
}
