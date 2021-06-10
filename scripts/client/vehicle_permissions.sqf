private [ "_doeject" ];

_doeject = false;

while { true } do {

	waitUntil { alive player };

	waitUntil { sleep 0.2;
		vehicle player == player
	};

	waitUntil { sleep 0.2;
		(vehicle player != player) &&  ( (vehicle player ) getCargoIndex player ) < 0  && isTouchingGround (vehicle player) && !((vehicle player ) isKindOf "ParachuteBase")
	};

	if ( (vehicle player ) isKindOf "Tank" ) then {
		if ( ! (  getPlayerUID player in ARMOR_PERMS ) ) then {
			_doeject = true;
			hint localize "STR_PERMISSION_NO_ARMOR";
		};
	} else {
		if ( (vehicle player ) isKindOf "Air" ) then {
			if ( ! (  getPlayerUID player in AIR_PERMS ) ) then {
				_doeject = true;
				hint localize "STR_PERMISSION_NO_AIR";
			};
		};
	};

	if ( _doeject ) then {
		moveOut player;
		_doeject = false;
	};
};
