/*
 *   Copyright 2015 Marco Martin <mart@kde.org>
 *
 *   This program is free software; you can redistribute it and/or modify
 *   it under the terms of the GNU Library General Public License as
 *   published by the Free Software Foundation; either version 2 or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU Library General Public License for more details
 *
 *   You should have received a copy of the GNU Library General Public
 *   License along with this program; if not, write to the
 *   Free Software Foundation, Inc.,
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 */

import QtQuick 2.1
import QtQuick.Window 2.2
import QtQuick.Controls 1.2 as Controls
import QtQuick.Layouts 1.2

import org.kde.kirigami 1.0 as Kirigami
import org.kde.plasma.core 2.0 as PlasmaCore
// import org.kde.plasma.components 2.0 as PlasmaComponents
// import org.kde.plasma.extras 2.0 as PlasmaExtras
//
// import org.kde.kgpio 1.0 as KGpio

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
            wrapMode: Text.WordWrap
            opacity: 0.8
            text: "Showing the readings of various sensors connected to the system."

            Layout.fillWidth: true
            Layout.fillHeight: false
        }
        Controls.Label {
            font.pointSize: titlePointSize
            wrapMode: Text.WordWrap
            opacity: 0.8
            text: "Light Sensor"
            Layout.fillWidth: true
        }
        LightSensorItem {
            Layout.fillWidth: true
            Layout.preferredHeight: units.gridUnit * 4
        }

        Controls.Label {
            font.pointSize: titlePointSize
            wrapMode: Text.WordWrap
            opacity: 0.8
            text: "Temperature Sensor"
            Layout.fillWidth: true
        }
        TemperatureSensorItem {
            Layout.fillWidth: true
            Layout.preferredHeight: units.gridUnit * 4
        }
    }
}

