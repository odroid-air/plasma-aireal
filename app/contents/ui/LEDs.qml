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

import QtQuick 2.3
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2
import QtQuick.Controls 1.2 as Controls

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import org.kde.kirigami 1.0 as Kirigami

import org.kde.kgpio 1.0 as KGpio

Kirigami.ScrollablePage {
    id: pageRoot

    implicitWidth: units.gridUnit * 20

    background: Rectangle {
        color: Kirigami.Theme.viewBackgroundColor
    }

    title: "LEDs"

    ColumnLayout {

//         anchors {
//             fill: parent
//             margins: units.gridUnit
//         }

        spacing: units.gridUnit

        Controls.Label {
            wrapMode: Text.WordWrap
            opacity: 0.8
            text: "Control LEDs on the circuit board."

            Layout.fillWidth: true
            Layout.fillHeight: false
        }

        KGpio.KGpioController {
            id: gpio
        }

        ListView {
            id: ledlist

            Layout.fillWidth: true
            Layout.fillHeight: true

            model: gpio.pins
            orientation: Qt.Horizontal
            spacing: units.gridUnit
            interactive: contentHeight > height

            delegate: Rectangle {
                id: pindelegate
                width: units.gridUnit * 6
                height: width
                radius: units.gridUnit

                function ledColor(pinNumber) {
                    if (pinNumber == 108) return "green";
                    if (pinNumber == 100) return "red";
                    if (pinNumber == 97) return "yellow";
                    return "darkblue";
                }

                color: ledColor(number);
                opacity: burning ? 1.0 : 0.8

                property bool burning: false

                PlasmaComponents.Label {
                    anchors.centerIn: parent
                    //text: ledColor(number) + " LED"
                    text: (pindelegate.burning ? "on" : "off")
                }

                Rectangle {
                    color: "black"
                    opacity: pindelegate.burning ? 0 : 0.8
                    Behavior on opacity { NumberAnimation { duration: units.shortDuration } }
                    radius: Math.ceil(units.gridUnit * (14.0 / 12))
                    anchors {
                        fill: parent
                        margins: units.gridUnit
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        writeValue(pindelegate.burning ? "0" : "1");
                        pindelegate.burning = !pindelegate.burning;
                        print("Pin Clicked " + ledColor(number) + "(" + number + ") : " + (pindelegate.burning ? "on" : "off"));
                        //pinValue = KGpio.GpioPin.High;
                    }
                }
            }
        }

    //     PlasmaComponents.Label {
    //         anchors {
    //             right: ledlist.right
    //             bottom: ledlist.bottom
    //         }
    //         text: "Pins: " + gpio.pins.length
    //     }
    }
}
