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
// import org.kde.plasma.components 2.0 as PlasmaComponents
// import org.kde.plasma.extras 2.0 as PlasmaExtras

import org.kde.kgpio 1.0 as KGpio

PlasmaCore.IconItem {
    id: weatherIcon

    source: "weather-few-clouds"
    opacity: 0.8

    KGpio.ThermoSensor {
        id: thermo
        sensorId: "28-0000080b1db9"
    }


    Controls.Label {
        id: temperatureLabel
        text: Math.round(thermo.temperature) + "°"
        font.pixelSize: parent.height / 8
        anchors {
            bottom: parent.bottom
            right: parent.right
            // aligns nicely with cloud of the icon :)
            bottomMargin: parent.height / 4.5
            rightMargin: parent.width / 7
        }
        color: "black"
        opacity: 0.6
    }
}
