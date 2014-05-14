// Калькулятор на QML v0.95 | Класс для кнопок с цифрами

import QtQuick 2.0;
import Ubuntu.Components 0.1;

Button {
    width: 60; height: 50;
    property alias value: labelOp.text;

    Text {
        id: labelOp;
        anchors.centerIn: parent;
        text: "";
        font.pointSize: 12;
        color: "#FDFDFD";
    }

    MouseArea {
        anchors.fill: parent;

        onClicked: {

            if(blocksStorage.get(0).value === "0") {
                blocksStorage.get(0).value = "0";
                blocksStorage.append({ value: labelOp.text });
            }

            if(isOp === true) {
                isNum = false;
                blocksStorage.get(blocksStorage.count-1).value = labelOp.text;
            }
            else {
                blocksStorage.append({ value: "" });
                i+=2;
                isOp = true;
            }
        }
    }
}
