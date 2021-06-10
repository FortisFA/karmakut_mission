params [
    ["_player", player, [objNull]]
];

if !(isPlayer _player) exitWith {["No player given"] call BIS_fnc_error; false};
//open factory
_player addAction [
("<t color=""#ff9600"">" + "build menu" + "</t>"),
 {
     if (!R3F_LOG_mutex_local_lock &&
      (_player distance (nearestObject [getPos _player, FOB]) < 300) &&
      (nearestObject [getPos _player, FOB] in ACTIVE_FOBS) &&
      _player in BUILD_PERMS) then {
      [nearestObject [getPos _player, FOB]] call R3F_LOG_FNCT_factory_open_factory;
     } else {hint "not available"};
 },
  nil, 5, false, true, "",""];
//redeploy
_player addAction [
"<t color=""#ff9600"">" + "Transfer to another FOB" + "</t>",
 {
 if (_player distance (nearestObject [getPos _player, FOB]) < 300 && count ACTIVE_FOBS > 0) then {
      {
         {
            _player addAction [
                format ["FOB %1, %2, %3", getPos _x select 0, getPos _x select 1, getPos _x select 2],
                {
                    if ([getPos _x, 100, east] call Karma_fnc_getUnitsCount < 3) then {
                        _player setPos (getPos _x vectorAdd [random[2,3,4],random[2,3,4],0]);
                    } else {
                        hint "enemy at the FOB";
                    };
                }
            ];
        } forEach ACTIVE_FOBS;
      }
 } else {hint "not at FOB"};
 }];

_player addAction[
  "TOGGLE FOB STATUS",
  {
  	private _trg = cursorTarget;
  	if (cursorTarget in ACTIVE_FOBS) then {
  	    ACTIVE_FOBS = ACTIVE_FOBS - cursorTarget;
  	    STATIC_FOBS = STATIC_FOBS + cursorTarget;
  	    profileNamespace setVariable ["ACTIVE_FOBs", ACTIVE_FOBS];
  	    profileNamespace setVariable ["STATIC_FOBs", ACTIVE_FOBS];
  	} else {
  	    if ([getPos _trg, 300, east] call Karma_fnc_getUnitsCount < 3) then {
            ACTIVE_FOBS = ACTIVE_FOBS + cursorTarget;
            STATIC_FOBS = STATIC_FOBS - cursorTarget;
            profileNamespace setVariable ["ACTIVE_FOBs", ACTIVE_FOBS];
            profileNamespace setVariable ["STATIC_FOBs", ACTIVE_FOBS];
        } else {
            hint "enemy nearby. clear the area";
        };
  	};
  },
  "",
  10,
  true,
  true,
  "",
  '
  	((cursorTarget) in ACTIVE_FOBS or (cursorTarget) in STATIC_FOBS)
  '
  ];
