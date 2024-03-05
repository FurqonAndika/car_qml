import QtQuick 2.15
import QtQuick.Window 2.15

import QtQuick.Extras 1.4

//import QtLocation 5.6
//import QtPositioning 5.6
//import QtQuick.Studio.Components 1.0
import QtQuick.Controls 2.15


Window {
    width: 1024
    minimumWidth: 1024
    maximumWidth: 1024
    height: 600
	minimumHeight: 600
	maximumHeight: 600
    visible: true
    title: qsTr("Dashboard")
    color: "black"
    //    flags: Qt.FramelessWindowHint
	flags: Qt.FramelessWindowHint | Qt.Window

    /*
	Plugin {
        id: mapPlugin
        name:"osm" // "mapboxgl", "esri", ...
        // specify plugin parameters if necessary
        // PluginParameter {
        //     name:
        //     value:
        // }
    }

    Map {
        visible: false
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        plugin: mapPlugin
        center: QtPositioning.coordinate( -6.91,107.6) // bdg
        zoomLevel: 14
        copyrightsVisible: false
        color: 'red'




    }
*/
    Image {
        id: image1
        x: 0
        y: 0
        width: 1024
        height: 600
        source: "asset/background_empty.png"
        fillMode: Image.PreserveAspectFit


        Text {
            id: text2
            x: 117
            y: 450
            color: "#ffffff"
            visible : false
            text: qsTr("Designed by HIDTECH")
            font.pixelSize: 16
            font.bold: true
            font.italic: true
        }

        Text {
            id: text5
            x: 504
            y: 432
            visible: false
            color: "#ffffff"
            text: qsTr("N")
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
        }

        Image {
            id: image
            x: 323
            y: 126
            width: 49
            height: 47
            visible: false
            source: "asset/arrow.png"
            rotation: -180
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image5
            x: 411
            y: 198
            width: 216
            height: 216
            visible: true
            source: "asset/pngwing.com (2).png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image6
            x: 397
            y: 124
            width: 50
            height: 50
            visible: false
            source: "asset/lampu dekat.png"
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image7
            x: 588
            y: 124
            width: 50
            height: 50
            visible: false
            source: "asset/lampu jauh.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text9
            x: 449
            y: 117
            width: 127
            height: 30
            objectName: "date_label"
            color: "#fbfbfb"
            text: qsTr("07-04-2023")
            font.pixelSize: 25
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
        }

        Text {

            id: hour_label
            objectName: "hour_label"
            x: 466
            y: 145
            color: "#fbfbfb"
            text: "00:00:00"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
        }

        Rectangle {
            id: rectangle
            x: 763
            y: 441
            width: 20
            height: 37
            color: "white"
            border.color: "white"
            border.width:1
            property real persen;
            persen :0.63
            rotation: 180
            objectName: "batteryValue"
            Rectangle{
                color:"#28ad4c"
//                anchors.fill: rectangle
//                anchor.left:parent.left
//                anchor.right:rectangle.right
                width:rectangle.width
                height:rectangle.height*rectangle.persen
                border.color:'white'



            }
        }

        Rectangle {
            id: rectangle1
            x: 768
            y: 436
            width: 9
            height: 4
            color: "#ffffff"
        }
    }

    CircularGauge {
        id: circularGauge
        x: 57
        y: 165
        width: 322
        height: 271
        layer.wrapMode: ShaderEffectSource.ClampToEdge
        maximumValue: 200
        tickmarksVisible : true
        value: 0
        objectName: 'speed'
        stepSize: 1
        Text {
            id:textGauge
            x: 130
            y: 153
            width: 63
            height: 40
            anchors.centerIn: circularGauge.Center
            anchors.bottom: circularGauge.bottom
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
//            font.family: "Verdana"
            textFormat: Text.RichText
            font.pointSize: 30
            anchors.bottomMargin: 78
            font.family:'Digital-7'
            color: 'white'
            text:String(circularGauge.value)
            objectName: "foo_object"
        }

        Image {
            id: image2
            x: 44
            y: 100
            width: 63
            height: 63
            visible: false
            source: "asset/image-removebg-preview.png"
            clip: false
            fillMode: Image.PreserveAspectFit


        }

        Image {
            id: image3
            x: 202
            y: 107
            width: 60
            height: 60
            visible: false
            source: "asset/information.png"
            clip: false
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text1
            x: 144
            y: 57
            color: "#fffafa"
            text: qsTr("KM/H")
            font.pixelSize: 12
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
        }

        Text {
            id: textGauge1
            x: 708
            y: 153
            width: 74
            height: 40
            color: "#ffffff"
            anchors.bottom: circularGauge1.bottom
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
            anchors.centerIn: circularGauge1.Center
            text:String(circularGauge1.value)
            font.family: "Digital-7"
            textFormat: Text.RichText
            font.pointSize: 30
            anchors.bottomMargin: 78
        }

        Text {
            id: text6
            x: 103
            y: 270
            visible: false
            color: "#ffffff"
            text: qsTr("TOTAL")
            font.pixelSize: 15
            font.bold: true
        }

        Text {
            id: text7
            x: 133
            y: 284
            visible: false
            color: "#ffffff"
            text: qsTr("128 KM")
            font.pixelSize: 25
            font.italic: true
            font.bold: true
        }

        Image {
            id: image8
            x: 321
            y: 211
            width: 70
            height: 70
            source: "asset/temp.png"
            clip: false
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text13
            x: 282
            y: 242
            color: "#ffffff"
            text: qsTr("123 °C")
			objectName : "temperature"
            font.pixelSize: 15
            horizontalAlignment: Text.AlignHCenter
            font.bold: true
        }

        Image {
            id: image9
            x: 424
            y: 317
            width: 80
            height: 80
            visible: false
            source: "asset/hazard.png"
            clip: false
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image10
            x: 639
            y: 108
            width: 60
            height: 60
            visible: false
            source: "asset/door.png"
            clip: false
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image11
            x: 798
            y: 107
            width: 46
            height: 46
            visible: false
            source: "asset/park.png"
            clip: false
            fillMode: Image.PreserveAspectFit
        }

        Image {
            id: image12
            x: 580
            y: 211
            width: 67
            height: 67
            source: "asset/room_temp.png"
            fillMode: Image.PreserveAspectFit
            clip: false
        }

        Text {
            id: text14
            x: 531
            y: 242
            color: "#ffffff"
            text: qsTr("132 °C")
            font.pixelSize: 15
            horizontalAlignment: Text.AlignHCenter
            objectName: "engine_temp"
            font.bold: true
        }
    }


    CircularGauge {
        id: circularGauge1
        x: 641
        y: 165
        width: 322
        height: 271
        layer.wrapMode: ShaderEffectSource.ClampToEdge
		objectName :'rpm'
        value:0
		visible:true
        ColorAnimation {
            duration: 200
            to: "#ff0000"
            from: "#008000"
        }

//        ProgressBar {
//            id: progressBar
//            x: 130
//            y: 362
//            width: 50
//            height: 20
//            scale: 1

//            value:0.2
//            rotation: 90
//            contentItem: Rectangle {
//                anchors.left:progressBar.left
//                anchors.right: ProgressBar.right
//                color: "white"
//                radius: parent.radius
//                border.width: 1
//                border.color: "black"
//                width: parent.width * (1-progressBar.value)

//            }
//            background: Rectangle {
//                anchors.fill: progressBar
//                color: "#28ad4c"
//                radius: parent.radius
//                border.width: 1
//                border.color: "black"
//                width: parent.width*parent.value
//            }



//        }

        Text {
            id: text8
            x: 148
            y: 268
            color: "#fffefe"
            text: qsTr("")
            objectName:"current"
            font.pixelSize: 22
            font.bold: true
        }

        Text {
            id: text11
            x: 148
            y: 288
			objectName : "voltage"
            color: "#fffefe"
            text: qsTr("")
            font.pixelSize: 22
            font.bold: true
        }

        Text {
            id: text12
            x: 52
            y: 279
            visible: false
            color: "#fffefe"
            text: String(Math.round(rectangle.persen*100))+String('%')
            font.pixelSize: 25
            font.bold: true
        }

    }

    Text {
        id: text3
        x: 785
        y: 220
        width: 35
        height: 15
        color: "#fffafa"
        text: qsTr("RPM")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
    }

    Text {
        id: text4
        x: 785
        y: 241
        width: 35
        height: 15
        color: "#fffafa"
        text: qsTr("X1000")
        font.pixelSize: 12
        horizontalAlignment: Text.AlignHCenter
        font.bold: true
    }

    Image {
        id: image4
        x: 654
        y: 128
        width: 49
        height: 47
        source: "asset/arrow.png"
        fillMode: Image.PreserveAspectFit
        objectName: 'rightLight'
        visible: false
    }





}
