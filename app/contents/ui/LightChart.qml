/*
 *   Copyright 2017 Sebastian Kügler <sebas@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */
import QtCharts 2.1



import QtQuick 2.3
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 1.2 as Controls

import org.kde.kquickcontrolsaddons 2.0 as KQuickControlsAddons
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import org.kde.kirigami 1.0 as Kirigami

import org.kde.kgpio 1.0 as KGpio


Kirigami.ScrollablePage {
    id: pageRoot

    implicitWidth: Kirigami.Units.gridUnit * 20

    background: Rectangle {
        color: Kirigami.Theme.viewBackgroundColor
    }

    title: "Sensors"

    ColumnLayout {

        spacing: units.gridUnit / 2

        Controls.Label {
            font.pointSize: titlePointSize
            wrapMode: Text.WordWrap
            opacity: 0.8
            text: "Light Sensor"
            Layout.fillWidth: true
        }
        ChartView {
            id: lightChart
            Layout.fillWidth: true
            Layout.preferredHeight: units.gridUnit * 12
//             Layout.fillHeight: true
            //theme: ChartView.ChartThemeBrownSand
            antialiasing: true

            LineSeries {
                id: lightlines
                name: "LineSeries"
                XYPoint { x: 0; y: 0 }
//                 XYPoint { x: 1.1; y: 2.1 }
//                 XYPoint { x: 1.9; y: 3.3 }
//                 XYPoint { x: 2.1; y: 2.1 }
//                 XYPoint { x: 2.9; y: 4.9 }
//                 XYPoint { x: 3.4; y: 3.0 }
//                 XYPoint { x: 4.1; y: 3.3 }
            }
            Timer {
                id: tt
                property int ix: 0
                interval: 100
                running: true
                onTriggered: ix = ix+1
            }
            Connections {
                target: sensors
                onBrightnessChanged: {
                    print("brightness is now " + sensors.brightness);
                    lightlines.append(tt.ix, sensors.brightness);
                }
            }
        }

        Rectangle {
            border.width: 2
            border.color: "black"
            Layout.fillWidth: true
            //Layout.fillHeight: false
            Layout.preferredHeight: unitsgridUnit * 2

            Rectangle { anchors.fill: parent; anchors.margins: parent.border.width; color: "black" ; opacity: 0.6 }
            Rectangle {
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                    margins: parent.border.width
                }
                width: Math.min((parent.width - parent.border.width * 2),
                                sensors.brightness * (parent.width - parent.border.width * 2))
                color: "yellow"
            }
            Controls.Label {
                text: sensors.brightness
                anchors {
                    right: parent.right
                    bottom: parent.bottom
                    margins: units.gridUnit / 2
                }
            }
        }
    //     Controls.Label {
    //         text: sensors.temperature + " scale: " + ((sensors.temperature + 20.0) / 60)
    //     }
    }
}