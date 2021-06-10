[] call compileFinal preprocessFileLineNumbers "GlobalVariables.sqf";
[] call compileFinal preprocessFileLineNumbers "configFile.sqf";
[] call compileFinal preprocessFileLineNumbers "objectInits.sqf";



//[] call compileFinal preprocessFileLineNumbers "scripts\shared\init_shared.sqf";
[] call compileFinal preprocessFileLineNumbers "karmakut\init_shared.sqf";

if (isServer) then {
    [] call compileFinal preprocessFileLineNumbers "scripts\server\init_server.sqf";
    [] call compileFinal preprocessFileLineNumbers "karmakut\init_server.sqf";
};

if (!isDedicated && hasInterface) then {

    // Add EH for curator to add kill manager and object init recognition for zeus spawned units/vehicles
    {
        _x addEventHandler ["CuratorObjectPlaced", {[_this select 1] call Karma_fnc_handlePlacedZeusObject;}];
    } forEach allCurators;

    waitUntil {alive player};
    [] call compileFinal preprocessFileLineNumbers "scripts\client\init_client.sqf";
    [] call compileFinal preprocessFileLineNumbers "karmakut\init_client.sqf";

}
