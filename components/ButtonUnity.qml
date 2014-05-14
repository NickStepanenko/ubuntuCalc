import QtQuick 2.0;
import Ubuntu.Components 0.1;

Button {
    width: 60; height: 50;

    Text {
        anchors.centerIn: parent;
        text: "Unity";
        font.pointSize: 12;
        color: "#FDFDFD";
    }

    MouseArea {
        anchors.fill: parent;

        onClicked: {
            blocksStorage.append({value: ""});
        }
    }
}
