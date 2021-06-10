if (isNil profileNamespace getVariable "STARTGAME") then {
    StartGame = 1;
    profileNamespace setVariable ["STARTGAME", 1];
    STATIC_FOBS =[0,0,0] nearObjects [FOB, 50000]; //get all static FOBS
    profileNamespace setVariable ["STATIC_FOBs", STATIC_FOBS];
    StartGame = 1;
} else {
  STATIC_FOBS = profileNamespace getVariable "STATIC_FOBs";
  ACTIVE_FOBS = profileNamespace getVariable "ACTIVE_FOBs";
};
