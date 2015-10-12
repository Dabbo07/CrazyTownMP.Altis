
    while { true } do {
		{
			if (side _x == west) then {
            	_dist = player distance _x;
				if (_dist < detRange) then {
                	player call localCivDamaged;
				};
            };
		} forEach playableUnits;
        uiSleep 1;
        playerLifeSpan = playerLifeSpan - 1;
		if (playerLifeSpan < 11) then {
			[
				format["<t color='#ff0000' align='center' shadow='1' size='0.5'>Bomb Timer: %1s</t>", playerLifeSpan],
				0, -0.15,
				1, 0
			] spawn BIS_fnc_dynamicText;
		} else {
			[
				format["<t color='#ffff00' align='center' shadow='1' size='0.5'>Bomb Timer: %1s</t>", playerLifeSpan],
				0, -0.15,
				1, 0
			] spawn BIS_fnc_dynamicText;
		};
        if (playerLifeSpan == 0) then {
            player call localCivDamaged;
        };
	};
