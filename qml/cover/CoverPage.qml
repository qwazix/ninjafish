/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0

import QtQuick.LocalStorage 2.0
import "../pages/include.js" as INC

CoverBackground {

    Item {
        id:ninjalogo
        property alias icon: image
        property string eyecolor: 'transparent' //transparent is a good default value
        width:parent.width
        y: Theme.paddingLarge
        Item {
            width:image.width
            height:image.height
            anchors.horizontalCenter: parent.horizontalCenter

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                opacity: 0.4
                id: image
                source: "../cover/coverimage.png"
            }

            GlassItem {
                visible: ninjalogo.eyecolor !=='transparent'
                color: ninjalogo.eyecolor
                width:image.width * 0.25
                height:image.height * 0.25
                x:image.width * 0.14
                y:image.height * 0.58
                cache: false

                falloffRadius: 0.25
                radius: 0.3
            }
            GlassItem {

                visible: ninjalogo.eyecolor !=='transparent'
                color: ninjalogo.eyecolor
                width:image.width * 0.26
                height:image.height * 0.25
                x:image.width * 0.51
                y:image.height * 0.58
                cache: false

                falloffRadius: 0.25
                radius: 0.3
            }
        }

    }


    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-cover-previous"
            onTriggered: {
                var favourites = INC.modules.favourites.get();
                INC.modules.actuate(favourites[0].id, favourites[0].data);
            }
        }
        CoverAction {
            iconSource: "image://theme/icon-cover-next"
            onTriggered: {
                var favourites = INC.modules.favourites.get();
                INC.modules.actuate(favourites[1].id, favourites[1].data);
            }
        }
    }

    Component.onCompleted: INC.modules.auth(INC.modules.settings.get('access_token'));
}
