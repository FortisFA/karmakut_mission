params [
    ["_pos", [0, 0, 0], [[]], [2, 3]],
    ["_radius", 300, [0]],
    ["_side", east, [sideEmpty]]
];

private _amount = _side countSide ((_pos nearEntities ["Man", _radius]) select {!(captive _x) && ((getpos _x) select 2 < 500)});
{
    _amount = _amount + (_side countSide (crew _x));
} forEach ((_pos nearEntities [["Car", "Tank", "Air", "Boat"], _radius]) select {((getpos _x) select 2 < 500) && count (crew _x) > 0});

_amount
