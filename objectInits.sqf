objectInits = [

    // Add helipads to zeus, as they can't be recycled after built
    [
        ["Helipad_base_F", "LAND_uns_Heli_pad", "Helipad", "LAND_uns_evac_pad", "LAND_uns_Heli_H"],
        {{[_x, [[_this], true]] remoteExecCall ["addCuratorEditableObjects", 2]} forEach allCurators;},
        true
    ],

    //Adds fob object to the
    [
        FOB,
        {[_this, 1000] call AdvLog_fnc_factoryInit;
        }
    ],

    // Add ACE variables to corresponding building types
    [
        repair_buildings,
        {_this setVariable ["ace_isRepairFacility", 1, true];}
    ],
    [
        medical_facilities,
        {_this setVariable ["ace_medical_isMedicalFacility", true, true];}
    ],
    [
        medical_vehicles,
        {_this setVariable ["ace_medical_isMedicalVehicle", true, true];}
    ],

    // Hide Cover on big GM trucks
    [
        ["gm_ge_army_kat1_454_cargo", "gm_ge_army_kat1_454_cargo_win"],
        {_this animateSource ["cover_unhide", 0, true];}
    ],


    // Crate to Aresenal
    [
        [Arsenal_typename], 
        {[_this] execVM "arsenal_presets\custom.sqf";}
    ],


    // Custom Karmakut Scripts createSimpleObject

    [
        ["USAF_A10"],
        {[_this] execVM "scripts\pylons\a10pylons.sqf";}
    ],

    [
        ["RHSGREF_A29B_HIDF"],
        {[_this] execVM "scripts\pylons\a29pylons.sqf";}
    ],

    [
        ["vtx_MH60M_DAP"],
        {[_this] execVM "scripts\pylons\dappylons.sqf";}
    ],

    [
        ["UK3CB_CW_US_B_LATE_AH64"],
        {[_this] execVM "scripts\pylons\ah64pylons.sqf";}
    ],

    [
        ["UK3CB_TKA_O_L39_PYLON"],
        {[_this] execVM "scripts\pylons\l39pylons.sqf";}
    ],

    [
        ["USAF_MQ9"],
        {[_this] execVM "scripts\pylons\reaperpylons.sqf";}
    ],

    [
        ["B_Radar_System_01_F"],
        {[_this] execVM "scripts\crew\radarcrew.sqf";}
    ],

    [
        ["itc_land_cram_praetorian2"],
        {[_this] execVM "scripts\crew\praetoriancrew.sqf";}
    ],

    [
        ["VirtualReammoBox_camonet_F"],
        {[_this] execVM "scripts\ammoboxes\USAFlaunchers.sqf";}
    ],

    [
        ["Box_NATO_Ammo_F"],
        {[_this] execVM "scripts\ammoboxes\USAFammo.sqf";}
    ],
    [
        ace_canCarry,
        {[_this, true, [0, 1.5, 0], 0] remoteExec ["ace_dragging_fnc_setCarryable"];}
    ],

];
