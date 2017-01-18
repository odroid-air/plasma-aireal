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
import QtQuick.Controls 1.2 as Controls

import org.kde.plasma.core 2.0 as PlasmaCore

ColumnLayout {
    id: sChart

    width: 800
    height: 600

    property alias text: headerlabel.text
    property alias label: lightlines.name
    property alias values: lightlines
    property alias chart: lightChart
    property int maxValue: 100



    property alias xLabel: valueAxisX.titleText
    property alias yLabel: valueAxisY.titleText
    property alias yMin: valueAxisY.min
    property alias yMax: valueAxisY.max

    function recordValue(y) {
        values.append(ticks.ix, y);
        valueAxisX.max = ticks.ix;
        valueAxisX.min = Math.max(0, x - sChart.maxValue);
        //print(" recorded: " + ticks.ix + " x " + y + " min: " + valueAxisX.min + " max: " + valueAxisX.max)
    }

    Timer {
        id: ticks
        property int ix: maxValue
        interval: 100
        repeat: true
        running: true
        onTriggered: {
            ix++;
        }
    }

    spacing: units.gridUnit / 2

    Controls.Label {
        id: headerlabel
        wrapMode: Text.WordWrap
        opacity: 0.8
        font.pointSize: 16
        text: "Light Sensor"
        Layout.fillWidth: true
    }
    ChartView {
        id: lightChart
        Layout.fillWidth: true
        Layout.fillHeight: true
        antialiasing: true

        ValueAxis {
            id: valueAxisY
            min: 0
            max: 1.0
            visible: titleText != ""
            titleText: "Intensity"
        }

        ValueAxis {
            id: valueAxisX
            // Hide the value axis; it is only used to map the line series to bar categories axis
            visible: titleText != ""
            min: 0
            max: sChart.maxValue
            //Math.max(10, lightlines.ix) // Math.max(10, lightlines.ix)
        }

        LineSeries {
            id: lightlines
            //name: "Light Intensity"
            axisX: valueAxisX
            axisY: valueAxisY
//             XYPoint { x: 1; y: 3.3 }
//             XYPoint { x: 2; y: 2.1 }
//             XYPoint { x: 3; y: 4.9 }
//             XYPoint { x: 4; y: 3.0 }
//             XYPoint { x: 5; y: 3.3 }
        }

    }

}
