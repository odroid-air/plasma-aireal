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
import QtQuick.Controls 1.2 as Controls
import QtQuick.Layouts 1.2
import org.kde.kirigami 1.0 as Kirigami

Kirigami.ApplicationWindow {
    id: root

    header: Kirigami.ApplicationHeader {}

    globalDrawer: Kirigami.GlobalDrawer {
        title: "Aireal"
        titleIcon: "applications-graphics"
        bannerImageSource: "banner.jpg"

        actions: [
            Kirigami.Action {
                text: "Overview"
                iconName: "view-list-icons"
                onTriggered: {
                    showPassiveNotification(text + " clicked");
                    pageStack.push(mainPageComponent);
                }
            },
            Kirigami.Action {
                text: "Settings"
                iconName: "folder-sync"
                        onTriggered: {
                            showPassiveNotification(text + " clicked");
                            pageStack.push(settingsComponent);
                        }
            }
        ]

    }
    contextDrawer: Kirigami.ContextDrawer {
        id: contextDrawer
    }

    pageStack.initialPage: mainPageComponent

    Component {
        id: settingsComponent
        Kirigami.Page {
            title: "Settings"
            objectName: "settingsPage"
            Rectangle {
                anchors.fill: parent
                Controls.Button {
                    anchors.centerIn: parent
                    text: "Remove Page"
                    onClicked: applicationWindow().pageStack.pop();
                }
            }
        }
    }

    //Main app content
    Component {
        id: mainPageComponent
        MainPage {}
    }

}
