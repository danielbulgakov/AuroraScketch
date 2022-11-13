import QtQuick 2.0
import Sailfish.Silica 1.0



Page {

    id: page

    allowedOrientations: Orientation.All

    Column{
        id : columnMain
        width : parent.width
        height: parent.height

        TextArea{
            id : hist
            anchors.bottom: textExpr.top
            font.pixelSize: 75
            readOnly: true;
            horizontalAlignment: TextEdit.AlignRight
            function addHist(str){
                if (hist.text.length != 0) hist.text += "\n";
                hist.text += str;
            }
        }

        TextArea{
            id: textExpr
            readOnly: true
            anchors.bottom: buttonsGrid.top
            anchors.right: parent.right
            anchors.rightMargin: 15
            font.pixelSize: 120
            horizontalAlignment: TextEdit.AlignRight

            property var firstOperand: null
            property var secondOperand: null
            property var operation: null

            function buttonClicked(op){
                if (!isNaN(op) || op === bDigDot.text || op === bM.text||
                        op === bPlusMinus.text) textExpr.handleDigits(op);
                else if (op === bDelAll.text) clear();
                else if (op === bDelLast.text) delPrev();
                else if (op === bOpEqual.text) compute();
                else handleOperations(op);
            }

            function handleDigits(op){
                var val;

                if (operation == null) val = firstOperand == null ? "" : firstOperand;
                else val = secondOperand == null ? "" : secondOperand;

                var opt = op;
                if (op === bDigDot.text) val += bDigDot.text
                else if (op === bPlusMinus.text) val = val <= 0 ? Number(val) : Number(-val);
                else if (op === bM.text) val = Number((Number(val) % 1).toFixed(5));
                else val += opt;

                if (operation == null) firstOperand = val;
                else secondOperand = val;

                displayText();
            }

            function handleOperations(op){
                operation = op;
                displayText();
            }

            function compute(){
                var i = c();
                hist.addHist(textExpr.text + "= " + i);
                clear();
                firstOperand = i;
                displayText();
            }

            function c (){
                if (firstOperand != null && operation != null && secondOperand != null){
                    var x = eval(Number(firstOperand) + operation + Number(secondOperand));
                    return Number((Number(x) ).toFixed(5));;
                }
            }


            function delPrev(){
                if (secondOperand != null) secondOperand = null;
                else if (operation != null) operation = null;
                else if (firstOperand != null) firstOperand = null;
            }

            function clear(){
                firstOperand = null;
                secondOperand = null;
                operation = null;
                textExpr.text = '0';
            }

            function displayText(){
                textExpr.text = "";
                if (textExpr.firstOperand != null) textExpr.text += firstOperand;
                if (textExpr.operation != null) textExpr.text += " " + operation;
                if (textExpr.secondOperand != null) textExpr.text += " " + secondOperand;
            }

            text: "0"

        }

        Grid{
            id: buttonsGrid
            width : parent.width
            height: parent.height / 2

            anchors.bottom: parent.bottom
            rows: 5; columns: 4

            anchors.bottomMargin: 10



            function calcButtonHeight () {
                return buttonsGrid.height / 5 - 10;
            }
            function calcButtonWidth() {
                return buttonsGrid.width / 4 - 10;
            }


            property int buttonswidth: calcButtonWidth()
            property int buttonsheight: calcButtonHeight()



            spacing: 10

            // 1 row
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDelAll
                text : "AC"
                backgroundColor: "grey"

            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bPlusMinus
                text : "+/-"
                backgroundColor: "grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bM
                text : "M"
                backgroundColor: "grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bOpDiv
                text : "/"
                backgroundColor: "orange"
            }
            // 2 row
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDig7
                text : "7"
                backgroundColor: "dark grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDig8
                text : "8"
                backgroundColor: "dark grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDig9
                text : "9"
                backgroundColor: "dark grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bOpMult
                text : "*"
                backgroundColor: "orange"
            }
            // 3 row
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDig4
                text : "4"
                backgroundColor: "dark grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDig5
                text : "5"
                backgroundColor: "dark grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDig6
                text : "6"
                backgroundColor: "dark grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bOpMinus
                text : "-"
                backgroundColor: "orange"
            }
            // 4 row
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDig2
                text : "2"
                backgroundColor: "dark grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDig1
                text : "1"
                backgroundColor: "dark grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDig3
                text : "3"
                backgroundColor: "dark grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bOpPlus
                text : "+"
                backgroundColor: "orange"
            }
            // 5 row
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDelLast
                text : "C"
                backgroundColor: "grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDig0
                text : "0"
                backgroundColor: "dark grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bDigDot
                text : "."
                backgroundColor: "grey"
            }
            Button{
                width: parent.buttonswidth; height: parent.buttonsheight; onClicked: textExpr.buttonClicked(this.text)
                id : bOpEqual
                text : "="
                backgroundColor: "orange"
            }

        }
    }
}
