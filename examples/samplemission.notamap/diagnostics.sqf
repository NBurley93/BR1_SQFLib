/*
All credit goes to KP_Liberation and Wyqer for creating this script (https://github.com/KillahPotatoes/KP-Liberation)

	MIT License
	Copyright (c) 2015 GreuhZbug, Wyqer
	Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
	The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

This will create markers located on the bottom left of the map stating Server and headless client FPS along with their respective local groups and units.
*/

private _sourcestr = "Server";
private _position = 0;

if (!isServer) then {
    if (!isNil "HC_1") then {
        if (!isNull HC_1) then {
            if (local HC_1) then {
                _sourcestr = "HC_1";
                _position = 1;
            };
        };
    };

    if (!isNil "HC_2") then {
        if (!isNull HC_2) then {
            if (local HC_2) then {
                _sourcestr = "HC_2";
                _position = 2;
            };
        };
    };

    if (!isNil "HC_3") then {
        if (!isNull HC_3) then {
            if (local HC_3) then {
                _sourcestr = "HC_3";
                _position = 3;
            };
        };
    };
	if (!isNil "HC_4") then {
        if (!isNull HC_4) then {
            if (local HC_4) then {
                _sourcestr = "HC_4";
                _position = 4;
            };
        };
    };
	if (!isNil "HC_5") then {
        if (!isNull HC_5) then {
            if (local HC_5) then {
                _sourcestr = "HC_5";
                _position = 5;
            };
        };
    };
};

private _myfpsmarker = createMarker [format ["fpsmarker%1", _sourcestr], [0, -500 - (500 * _position)]];
_myfpsmarker setMarkerType "mil_start";
_myfpsmarker setMarkerSize [0.7, 0.7];

while {true} do {

    private _myfps = diag_fps;
    private _localgroups = {local _x} count allGroups;
    private _localunits = {local _x} count allUnits;

    _myfpsmarker setMarkerColor "ColorGREEN";
    if (_myfps < 30) then {_myfpsmarker setMarkerColor "ColorYELLOW";};
    if (_myfps < 20) then {_myfpsmarker setMarkerColor "ColorORANGE";};
    if (_myfps < 10) then {_myfpsmarker setMarkerColor "ColorRED";};

    _myfpsmarker setMarkerText format ["%1: %2 fps, %3 local groups, %4 local units", _sourcestr, (round (_myfps * 100.0)) / 100.0, _localgroups, _localunits];

    sleep 15; //updates FPS and markers every 15 secounds
};
