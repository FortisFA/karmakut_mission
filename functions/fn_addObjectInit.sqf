params [
      ["_object", objNull, [objNull]]
  ];

if (isNull _object) exitWith {["Null object given"] call BIS_fnc_error; false};

// Create objectInitsCache object for this machine, if not present
if (isNil "objectInitsCache") then {objectInitsCache = createSimpleObject ["a3\weapons_f\empty.p3d", [-7580, -7580, 0], true];};

private _elements = objectInitsCache getVariable typeOf _object;

// Find and cache matching objectInits
if (isNil "_elements") then {
    _elements = objectInits select {
        _x params ["_classes", "", ["_inheritance", false]];

        if (_inheritance) then {
            {
                if (_object isKindOf _x) exitWith {true};
                false
            } forEach _classes // return
        } else {
            // return
            (toLower (typeOf _object)) in (_classes apply {toLower _x})
        };
    };

    objectInitsCache setVariable [typeOf _object, _elements];
};

if (_elements isEqualTo []) exitWith {
    false
};

{
    _object call (_x select 1);
} forEach _elements;

true
