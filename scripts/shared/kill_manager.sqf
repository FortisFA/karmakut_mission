params ["_unit", "_killer"];

if (isServer && !isplayer _unit) then {
    sleep 300;
    hidebody _unit;
    sleep 10;
    deleteVehicle _unit;
};
