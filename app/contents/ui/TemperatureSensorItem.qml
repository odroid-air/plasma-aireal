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

import org.kde.kquickcontrolsaddons 2.0 as KQuickControlsAddons
import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents
import org.kde.plasma.extras 2.0 as PlasmaExtras

import org.kde.kirigami 1.0 as Kirigami

import org.kde.kgpio 1.0 as KGpio


ColumnLayout {

    function colorForTemperature(temp) {
        if (temp < 19) return "darkblue";
        if (temp < 20) return "lightblue";
        if (temp < 21) return "lightgreen";
        if (temp < 22) return "green";
        if (temp < 23) return "yellow";
        if (temp < 24) return "orange";
        return "red";
    }

    Rectangle {
        border.width: 2
        border.color: "black"
        Layout.fillWidth: true
        Layout.fillHeight: true
        Rectangle { anchors.fill: parent; anchors.margins: parent.border.width; color: "black" ; opacity: 0.6 }
        Rectangle {
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                margins: parent.border.width
            }
            width: Math.min((parent.width - parent.border.width * 2), ((sensors.temperature + 20.0) / 60) * (parent.width - parent.border.width * 2))
            color: colorForTemperature(sensors.temperature)
        }
        Controls.Label {
            text: Math.round(sensors.temperature*10)/10 + "°C"
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