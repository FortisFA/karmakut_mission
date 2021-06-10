
params [
    ["_obj", objNull, [objNull]]
];

// Identify kind of placed object once
private _unit = _obj in allUnits;
private _vehicle = _obj in vehicles;
private _crate = (toLower (typeOf _obj)) in [Small_Barrel, Bigger_Barrel];

// Exit if building and no resource crate
if !(_unit || _vehicle || _crate) exitWith {false};

// For a vehicle apply clear cargo
if (_vehicle) then {
    [_obj] call Karma_fnc_clearCargo;

    // Add kill manager and object init to possible crew units
    {
        _x addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
        [_x] call Karma_fnc_addObjectInit;
    } forEach (crew _obj);
};

// Apply kill manager, if it's not a crate
if !(_crate) then {
    _obj addMPEventHandler ["MPKilled", {_this spawn kill_manager}];
} else {
    // Otherwise apply all needed values/functionalities
    _obj setMass 500;
    [_obj, true] call Karma_fnc_clearCargo;
    [_obj, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];
};

// Add object init codes
[_obj] call Karma_fnc_addObjectInit;

true
