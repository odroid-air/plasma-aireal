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

    Rectangle {
        id: lightbar
        border.width: 2
        border.color: "black"
        Layout.fillWidth: true
        Layout.preferredHeight: units.gridUnit * 3
        Rectangle { anchors.fill: parent; anchors.margins: parent.border.width; color: "black" ; opacity: 0.6 }
        Rectangle {
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
                leftMargin: parent.border.width
                topMargin: parent.border.width
                bottomMargin: parent.border.width
            }
            width: Math.min((parent.width - parent.border.width * 2),
                             sensors.brightness * (parent.width - parent.border.width * 2) * sensitivitySlider.value)
            color: "yellow"
        }
        Controls.Label {
            text: Math.round(sensors.brightness * 1000) / 1000
            anchors {
                right: parent.right
                bottom: parent.bottom
                margins: units.gridUnit / 2
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
            maximumValue: 50
            value: 10
        }
    }
}