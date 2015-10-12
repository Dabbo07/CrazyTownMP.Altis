
	while {!stopSpawningCivs} do {
	
		_co = 0;
		while {_co < count civUnits} do {

			_tmp = civUnits select _co;
            
			{
				if (side _x == west) then {
                	_dist = _tmp distance _x;
					if (_dist < detRange) then {
                    	_tmp setVariable ["explodeUnit", true, true];
					};
                };
			} forEach playableUnits;
            
            if(_tmp getVariable ["explodeUnit", false]) then {
				_tmp setVariable ["explodeUnit", false, true];
				_kx = getPos _tmp select 0;
				_ky = getPos _tmp select 1;
				"R_PG32V_F" createVehicle [_kx, _ky, 0.5];
                [_tmp] spawn relocateCiv;
			};
			_co = _co + 1;
		};
		uiSleep .05;
		
	};