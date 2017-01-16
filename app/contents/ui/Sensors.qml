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

import org.kde.kgpio 1.0 as KGpio


Item {

    property alias brightness: light.brightness
    property alias temperature: thermo.temperature
    property alias leds: gpio.pins

    KGpio.KGpioController {
        id: gpio
    }

    KGpio.LightSensor {
        id: light
        number: 104
    }

    KGpio.ThermoSensor {
        id: thermo
        sensorId: "28-0000080b1db9"
    }


}