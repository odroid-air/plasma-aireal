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
//import QtQuick.Window 2.2
import QtQuick.Controls 1.2 as Controls

import org.kde.plasma.core 2.0 as PlasmaCore
import org.kde.plasma.components 2.0 as PlasmaComponents

ColumnLayout {

    width: 800
    height: 600

    spacing: units.gridUnit / 2

    Controls.Label {
        wrapMode: Text.WordWrap
        opacity: 0.8
        text: "Light Sensor"
        Layout.fillWidth: true
    }
    ChartView {
        id: lightChart
        property int maxValue: width /2
        Layout.fillWidth: true
//         Layout.preferredHeight: units.gridUnit * 12
        Layout.fillHeight: true
//         theme: ChartView.ChartThemeBrownSand
        antialiasing: true

        ValueAxis {
            id: valueAxisY
            min: 0
            max: 1
            titleText: "Intensity"
        }

        ValueAxis {
            id: valueAxisX
            // Hide the value axis; it is only used to map the line series to bar categories axis
            //visible: false
            min: 0
            max: lightChart.maxValue
            //Math.max(10, lightlines.ix) // Math.max(10, lightlines.ix)
        }

        LineSeries {
            id: lightlines
            name: "Light Intensity"
            axisX: valueAxisX
            axisY: valueAxisY
//             XYPoint { x: 0; y: 1 }
//             XYPoint { x: 0; y: 0 }
//             XYPoint { x: 50; y: 0 }
//             XYPoint { x: 0; y: 0 }
//                 XYPoint { x: 1.9; y: 3.3 }
//                 XYPoint { x: 2.1; y: 2.1 }
//                 XYPoint { x: 2.9; y: 4.9 }
//                 XYPoint { x: 3.4; y: 3.0 }
//                 XYPoint { x: 4.1; y: 3.3 }
        }

        LineSeries {
            id: lightlines2
            name: "Light Strength"
            axisX: valueAxisX
            axisY: valueAxisY
        }

        Timer {
            id: ticks
            property int ix: 0
            interval: 1000
            repeat: true
            running: true
            onTriggered: {
                var x = ix;
                var y = Math.random() / 4 + 0.5;
                var y2 = Math.random() * 0.3;
                print("new x,y: " + x + ", " + y + "      " + y2);
                lightlines.append(x, y);
                lightlines2.append(x, y2);
                if (x > lightChart.maxValue) {
                    valueAxisX.max = x;
                    valueAxisX.min = Math.max(0, x - lightChart.maxValue);
                }
                ix++;
            }
        }
    }

}
