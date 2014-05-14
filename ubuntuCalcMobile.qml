import QtQuick 2.0
import Ubuntu.Components 0.1
import "components"

Rectangle {
    id: page;
    width: 625; height: 700;
    color: "#202020"
    property string expr: "";
    property string res: "";

    property bool isNum: true;
    property bool isOp: false;

    property bool isPressed: false;

    property var a: [10, 10,
                     30, 20,
                     50, 10,
                     10, 30,
                     30, 40,
                     50, 30,];
    property int i: 0;

    onExprChanged: {
        equationText.text = expr;
    }

    onResChanged: {
        resultText.text = res;
    }

    Rectangle {
        id: workingField
        width: parent.width - 10
        height: parent.height / 1.60
        anchors.horizontalCenter: page.horizontalCenter; y: 5
        color: "white"
        radius: 9
        opacity: 1
    }

    Rectangle {
        id: equationField
        width: parent.width - 10
        height: 25

        radius: 9

        anchors.left: parent.left; anchors.top: workingField.bottom; anchors.margins: 5

        Text {
            id: equationText
            anchors.fill: parent
            anchors.margins: 10
            text: "0"
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            color: "black"
        }
    }


    Canvas {
        id: blocksUnity;
        antialiasing: true;
        anchors.fill: parent;

        onPaint: {
            var ctx = blocksUnity.getContext("2d");
            ctx.lineWidth = "1";
            ctx.strokeStyle = "black";

            var children = blocksView.contentItem.children;

            ctx.clearRect(0,0, blocksUnity.width, blocksUnity.height)

            ctx.moveTo(children[0].x, children[0].y);

            if(blocksStorage.count>1) {
                for(var i=0; i<blocksStorage.count; i++) {
                    ctx.beginPath();
                    ctx.moveTo(children[i].x+children[i].width/2,   children[i].y+children[i].height/2);
                    ctx.lineTo(children[i+1].x+children[i].width/2, children[i+1].y+children[i].height/2);
                    ctx.stroke();
                    ctx.closePath();
                }
            }
        }

        Timer {
            interval: 0,01; running: true; repeat: true; onTriggered: blocksUnity.requestPaint();
        }
    }


    Rectangle {
        id: resultField
        width: 186
        height: 35;
        x: 391; y:390
        radius: 9

        color: "#ff6e00"

        Text {
            id: resultText
            anchors.fill: parent
            anchors.margins: 10
            text: "0"
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 12
            color: "black"
        }
    }


    ListModel {
        id: blocksStorage;

        ListElement {
            value: "0";
        }
    }

    GridView {
        id: blocksView;

        anchors.fill: parent;
        model: blocksStorage;

        delegate: Rectangle {
            width: 100;
            height: 35;
            x: 20; y: 20;
            color: "orange"
            radius: 5;
            border { color: "black"; width: 2; }

            Text {
                anchors.centerIn: parent;
                text: model.value;
                font.pointSize: 12;
                color: "black";
            }

            Drag.hotSpot.x: 1;
            Drag.hotSpot.y: 1;

            MouseArea {
                anchors.fill: parent;
                drag.target: parent;

                onPressAndHold: {
                    blocksUnity.redraw;
                }
            }
        }
    }


    Grid {
        id: numpadNumbers              // Панель кнопок с числами
        x: 5; anchors.top: equationField.bottom; anchors.bottomMargin: 4
        anchors.margins: 5
        rows: 4; columns: 3; spacing: 3

        ButtonNums { value: "7" }
        ButtonNums { value: "8" }
        ButtonNums { value: "9" }
        ButtonNums { value: "4" }
        ButtonNums { value: "5" }
        ButtonNums { value: "6" }
        ButtonNums { value: "1" }
        ButtonNums { value: "2" }
        ButtonNums { value: "3" }
        ButtonNums { value: "," }
        ButtonNums { value: "0" }
        ButtonClear { }
    }

    Grid {
        id: numpadOperations           // Панель кнопок с операциями
        anchors.left: numpadNumbers.right; anchors.bottomMargin: 4; anchors.leftMargin: 62
        anchors.top: equationField.bottom; anchors.margins: 5
        rows: 4; columns: 3; spacing: 3

        ButtonBlockAdd { }
        ButtonUnity { }
        ButtonBlockRemove { }
        ButtonOps { value: "+" }
        ButtonOps { value: "-" }
        ButtonOps { value: "*" }
        ButtonOps { value: "/" }
        ButtonOps { value: "xʸ" }
        ButtonOps { value: "√x" }
        ButtonCalculate { }
        ButtonHooks { }
    }
}
