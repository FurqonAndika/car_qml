import QtQuick 2.15
import QtQuick.Window 2.15
//import QtQuick.Controls.Styles 1.4
//import QtQuick.Extras 1.4
import QtQuick.Extras 1.4

import QtLocation 5.6
import QtPositioning 5.6
//import QtQuick.Studio.Components 1.0
import QtQuick.Controls 2.15


Window {
    width: 1280
    height: 600
    visible: true
    title: qsTr("Dashboard")
    color: "green"

    Text {
        id: text1
        x: 568
        y: 227
        color: "#22c4ff"
        text: "46"
        font.pixelSize: 100
        horizontalAlignment: Text.AlignHCenter
        textFormat: Text.RichText
        font.italic: true
        font.bold: true
    }

    Text {
        id: text2
        x: 702
        y: 330
        color: "#22c4ff"
        text: "MPH"
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
        font.italic: true
        textFormat: Text.RichText
    }

    Gauge {
        id: gauge
        x: 618
        y: 360
        width: 45
        height: 230
        rotation: 90
        value: 50

    }

    CircularGauge {
        id: circularGauge
        x: 94
        y: 184

    }

    Tumbler {
        id: tumbler
        x: 368
        y: 380
    }

    Rectangle {
        id: rectangle
        x: 381
        y: 37
        width: 191
        height: 193
        color: "#ffffff"
    }


}
