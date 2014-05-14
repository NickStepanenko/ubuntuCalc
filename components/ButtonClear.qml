import QtQuick 2.0;
import Ubuntu.Components 0.1;

Button {
    width: 120; height: 50;

    Text {
        id: labelDef;
        anchors.centerIn: parent;
        text: "C";
        font.pointSize: 12;
        color: "#FDFDFD";
    }

    MouseArea {
        anchors.fill: parent;

        onClicked: {
            if(labelDef.text === "C") {
                expr = "";
                res = "0";
                blocksStorage.clear();
                blocksStorage.append({value: ""});
            }
        }
    }
}
