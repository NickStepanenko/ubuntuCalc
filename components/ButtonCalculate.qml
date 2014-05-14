// Калькулятор на QML v0.95 | Класс для кнопок с цифрами

import QtQuick 2.0;
import Ubuntu.Components 0.1;
import "calculator.js" as PN;

Button {
    width: 60; height: 50;
    property int i: 0;

    Text {
        id: labelEq;
        anchors.centerIn: parent;
        text: "=";
        font.pointSize: 12;
        color: "#FDFDFD";
    }

    MouseArea {
        anchors.fill: parent;

        onClicked: {
            for(i=0; i<blocksStorage.count; i++) {
                expr += blocksStorage.get(i).value;
            }

            expr = PN.calculator.parse(expr);
            res = expr;
        }
    }
}
