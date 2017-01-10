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

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import org.kde.kgpio 1.0 as KGpio

Item {
    id: ledroot
    KGpio.KGpioController {
        id: gpio
    }

    ListView {
        id: ledlist
        anchors.fill: parent
        model: gpio.pins
        orientation: Qt.Horizontal
        spacing: pUnit
        interactive: contentHeight > height

        delegate: Rectangle {
            id: pindelegate
            width: pUnit * 14
            height: width
            radius: pUnit

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
                radius: Math.ceil(pUnit * (14.0 / 12))
                anchors {
                    fill: parent
                    margins: pUnit
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
