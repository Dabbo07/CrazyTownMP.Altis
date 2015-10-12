
	while {!stopSpawningCivs} do {
	
		_co = 0;
		while {_co < count civUnits} do {
			_tmp = civUnits select _co;

			_dist = spawnRange + 50;
			_target = objNull;
			{
        		if (side _x == west) then {
					_tmpDist = _tmp distance _x;
					if (_tmpDist < _dist) then {
						_dist = _tmpDist;
						_target = _x;
					};
                };
			} forEach playableUnits;
		
			if (_dist > spawnRange) then {
				_tmp setVariable ["explodeUnit", true, true];
			} else {
				// Try waypoints to make this more reliable?
				_tmp doMove position _target;
				_life = _tmp getVariable ["civLife", timeSpan];
				if (_life == 0) then {
					_tmp setVariable ["explodeUnit", true, true];
				};
			};
			
			_co = _co + 1;
			uiSleep 0.1;
		};
		
	};