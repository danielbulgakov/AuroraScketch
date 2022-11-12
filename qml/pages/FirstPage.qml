import QtQuick 2.0
import Sailfish.Silica 1.0



Page {

    id: page

    allowedOrientations: Orientation.All

    Label{
        id: labelExpr
        anchors.bottom: buttonsGrid.top
        anchors.right: parent.right
        anchors.rightMargin: 15
        font.pixelSize: 150


        text: "0"

    }

    Grid{
        id: buttonsGrid
        width : parent.width

        anchors.bottom: parent.bottom
        rows: 5; columns: 4

        anchors.bottomMargin: 10
        anchors.leftMargin: 10
        anchors.rightMargin: 10

//      без понятия как это сделать
//      readonly property int a : 4

        spacing: 10

        // 1 row
        Button{
            width: parent.width / 4
            id : bDelAll
            text : "AC"
            backgroundColor: "grey"
        }
        Button{
            width: parent.width / 4
            id : bPlusMinus
            text : "+/-"
            backgroundColor: "grey"
        }
        Button{
            width: parent.width / 4
            id : bPerc
            text : "%"
            backgroundColor: "grey"
        }
        Button{
            width: parent.width / 4
            id : bOpDiv
            text : "/"
            backgroundColor: "orange"
        }
        // 2 row
        Button{
            width: parent.width / 4
            id : bDig7
            text : "7"
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bDig8
            text : "8"
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bDig9
            text : "9"
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bOpMult
            text : "*"
            backgroundColor: "orange"
        }
        // 3 row
        Button{
            width: parent.width / 4
            id : bDig4
            text : "4"
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bDig5
            text : "5"
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bDig6
            text : "6"
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bOpMinus
            text : "-"
            backgroundColor: "orange"
        }
        // 4 row
        Button{
            width: parent.width / 4
            id : bDig1
            text : "1"
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bDig2
            text : "2"
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bDig3
            text : "3"
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bOpPlus
            text : "+"
            backgroundColor: "orange"
        }
        // 5 row
        Button{
            width: parent.width / 4
            id : bDelLast
            text : "C"
            backgroundColor: "grey"
        }
        Button{
            width: parent.width / 4
            id : bDig0
            text : "0"
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bDigDot
            text : "."
            backgroundColor: "dark grey"
        }
        Button{
            width: parent.width / 4
            id : bOpEqual
            text : "="
            backgroundColor: "orange"
        }

    }
}
