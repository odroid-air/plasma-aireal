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

        SensorChart {
            id: lchart

            label: "Light Intensity"

            yMin: 0.0
            yMax: 1.0 / sensitivitySlider.value

            Layout.fillWidth: true
            Layout.preferredHeight: units.gridUnit * 12

            Timer {
//                 id: tt
//                 property int ix: 0
                repeat: true
                interval: 1000
                running: true
                onTriggered: {
//                     ix = ix+1
//                     var x = ix + lchart.maxValue
                    lchart.recordValue(sensors.brightness);
                }
            }
            Connections {
                target: sensors
                onBrightnessChanged: {
                    //print("brightness is now " + sensors.brightness);
                    lchart.recordValue(sensors.brightness);
                    //lightlines.append(tt.ix, sensors.brightness);
                }
            }
        }
        RowLayout {
            Controls.Label {
                text: "Sensitivity:"
            }
            Controls.Slider {
                id: sensitivitySlider
                Layout.fillWidth: true
                minimumValue: 1
                maximumValue: 20
                value: 6
            }
        }
        Rectangle {
            border.width: 2
            border.color: "black"
            Layout.fillWidth: true
            Layout.preferredHeight: units.gridUnit * 2

            Rectangle { anchors.fill: parent; anchors.margins: parent.border.width; color: "black" ; opacity: 0.6 }
            Rectangle {
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                    margins: parent.border.width
                }
                width: Math.min((parent.width - parent.border.width * 2),
                                sensors.brightness * sensitivitySlider.value * (parent.width - parent.border.width * 2))
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

        SensorChart {
            id: tchart
            label: "Temperature (C)"
            text: "Temperature"

            yMin: 15.0
            yMax: 28.0

            Layout.fillWidth: true
            Layout.preferredHeight: units.gridUnit * 12
            Timer {
                repeat: true
                interval: 1000
                running: true
                onTriggered: {
                    tchart.recordValue(sensors.temperature);
                }
            }
        }

    }
}
