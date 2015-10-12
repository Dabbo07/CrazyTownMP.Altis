
	heloResuce = objNull;
	_heloInbound = false;
	_carAliveCheck = true;
	
	while {!stopSpawningCivs} do {
	
		_co = 0;
		while {_co < count civUnits} do {
			_tmp = civUnits select _co;
			_marker = format["mark%1", _co];
			_marker setMarkerPos position _tmp;
			_marker setMarkerColor "ColorPink";
			_co = _co + 1;
		};

        _co = 0;
        _westCount = 0;
		{
			_marker = format["plrM%1", _co];
			if (side _x == west) then {
	        	_marker setMarkerColor "ColorBlue";
                if (alive _x) then {
					_westCount = _westCount + 1; 
                };
	        } else {
	        	_marker setMarkerColor "ColorRed";
	        };
			_marker setMarkerPos position _x;
	        _co = _co + 1;
		} forEach playableUnits;
        
        if (_westCount == 0) then {
            stopSpawningCivs = true;
			[
				[],
				"stopGameFailed"
			] call BIS_fnc_MP;
            uiSleep 7;
            endMission "END1";
        };
        	
		if (_carAliveCheck && !(canMove car)) then {
			_carAliveCheck = false;
			[
				[ "TaskFailed", "Secure transport (Destroyed)" ],
				"showTask"
			] call BIS_fnc_MP;
		};
	
		if (!_heloInbound) then {
			{
				_dist = t1 distance _x;
				if (_dist < 40) then {
					execVM "server\heloExtract.sqf";
					_heloInbound = true;
				};
			} forEach playableUnits;
		} else {
			if (!isNull heloRescue) then {
				"heloMarker" setMarkerPos position heloRescue;
			};
		};
	
		uiSleep 1;
	};