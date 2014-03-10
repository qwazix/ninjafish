import QtQuick 2.0
import Sailfish.Silica 1.0

import QtQuick.LocalStorage 2.0

import "include.js" as Js
Page {
    id: mainPage

    ListModel {
        id: devicesModel
    }
    ListModel {
        id: pulldownModel
    }
    SilicaListView {
        id: listView
        anchors.fill: parent
        model: devicesModel
        PullDownMenu {

            id:optionspulley


            Repeater {
                id:pulleyrepeater
                model: pulldownModel
                MenuItem {
                    text: model.text ? model.text : ''
                    onClicked: {
                        Js.modules.callPulley(index);

                    }
                }
            }
        }
        header: PageHeader { title: "Ninjafish" }
        Row {
            width: parent.width
            visible: !root.authenticated
            Label {

                height: mainPage.height
                width: mainPage.width
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: 'Please log in. Pull down to do that.'

            }

        }
        delegate: DeviceListItem {}
        //VerticalScrollDecorator {}


        Component.onCompleted: {
            Js.modules.auth(Js.modules.settings.get('access_token'));
            Js.modules.loadDevices(devicesModel);

            Js.modules.setPulley(pulldownModel);
        }
    }
}





