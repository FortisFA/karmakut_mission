waitUntil { time > 0 }; // Wait until mission fully started
private _factories = [0,0,0] nearObjects [Factory_Buildings, 50000]; //get all factories
private _resourcesPerFactory = createHashMap;

{
 _resourcesPerFactory set [str (getPos _x), count (getPos _x nearObjects [[Small_Barrel, Bigger_Barrel], 200])];
} forEach _factories

while (true) do {
  {
      if ((_resourcesPerFactory get (str (getPos _x))) < Resource_Cap_Factory) then {   // if factory has less than 5 barrels
          private _barrel = nil;
          if (random [1,50,100] <= Small_Barrel_Chance) then { // chance of spawn of type of supplies. big or small
            _barrel = createVehicle [Small_Barrel, getpos _x, [], 0, "NONE"];
            _barrel setMass 125;
          } else {
            _barrel = createVehicle [Bigger_Barrel, getpos _x, [], 0, "NONE"];
            _barrel setMass 500;
          };
          _resourcesPerFactory set [getPos _x, _resourcesPerFactory get (str (getPos _x)) + 1]; // update the number of resources in the factory
      };
  } forEach _factories;
  sleep 3600; // wait 60 minutes until next spawn of supplies
};
