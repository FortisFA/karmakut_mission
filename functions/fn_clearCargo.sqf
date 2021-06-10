
params [
    ["_obj", objNull, [objNull]],
    ["_force", false, [false]]
];

if (isNull _obj) exitWith {["Null object given"] call BIS_fnc_error; false};

if (_force || {!((typeOf _obj) in [Small_Barrel, Bigger_Barrel]) && {{!((typeOf _obj) isKindOf "AllVehicles")}}}) then {
    clearWeaponCargoGlobal _obj;
    clearMagazineCargoGlobal _obj;
    clearBackpackCargoGlobal _obj;
    clearItemCargoGlobal _obj;
};

true
