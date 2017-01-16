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

    property int pUnit: (Screen.desktopAvailableHeight / 200) * 2 // make sure we align half values to pixels

    implicitWidth: Kirigami.Units.gridUnit * 20

    background: Rectangle {
        color: Kirigami.Theme.viewBackgroundColor
    }

    title: "Aireal Intro"

    ColumnLayout {

        anchors {
            fill: parent
            margins: units.gridUnit
        }

        spacing: pUnit

        Controls.Label {
            // The id is used to reference this item from the
            // button's onClicked function
            id: colorRect
//             Layout.leftMargin: units.gridUnit
//             Layout.rightMargin: units.gridUnit
            //font.pixelSize: pUnit * 3
            wrapMode: Text.WordWrap
            opacity: 0.8
            text: "Plasma Aireal shows real-time information about environmental factors, such as air quality. It uses various sensors present in the system to display levels of different gases present in your surroundings.<br/><br/>Aireal runs on top of Netrunner Core, showcasing KDE Plasma's power on embedded devices. "

            Layout.fillWidth: true
        }
        Weather {
            // It's supposed to grow in both direction
            Layout.preferredHeight: units.gridUnit * 10
            Layout.preferredWidth: units.gridUnit * 10
            //Layout.fillWidth: false
        }

    }

}

