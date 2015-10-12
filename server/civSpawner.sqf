
	civKilled = {
		_killed = _this select 0;
		_kx = getPos _killed select 0;
		_ky = getPos _killed select 1;
		"R_PG32V_F" createVehicle [_kx, _ky, 0.5];
	};
	
	spawnCiv = {
		_civId = _this select 0;
		
		_spawnTarget = call getTarget;
		_px = position _spawnTarget select 0;
		_py = position _spawnTarget select 1;
		if (_spawnTarget in crew car) then {
			_px = position car select 0;
			_py = position car select 1;
		};

		_rx = -(halfSpawnRange) + floor(random spawnRange);
		_ry = -(halfSpawnRange) + floor(random spawnRange);
		
		if (_ry > _rx) then {
			if (_rx > -bufferSpawnRange && _rx < bufferSpawnRange) then {
				if (_ry < 0 && _ry > -bufferSpawnRange) then {
					_ry = -bufferSpawnRange;
				};
				if (_ry > 0 && _ry < bufferSpawnRange) then {
					_ry = bufferSpawnRange;
				};
			};
		} else {
			if (_ry > -bufferSpawnRange && _ry < bufferSpawnRange) then {
				if (_rx < 0 && _rx > -bufferSpawnRange) then {
					_rx = -bufferSpawnRange;
				};
				if (_rx > 0 && _rx < bufferSpawnRange) then {
					_rx = bufferSpawnRange;
				};
			};
		};
		
		_nx = _px + _rx;
		_ny = _py + _ry;
		
		_grp = civGroups select _civId;
		_newUnit = _grp createUnit ["o_g_soldier_unarmed_f", [_nx, _ny, 0], [], 20, "FORM"];
		[_newUnit] join _grp;
		
		_grp setBehaviour "CARELESS";
		_grp setCombatMode "RED";
		_grp setSpeedMode "FULL";

        _newUnit setVariable ["explodeUnit", false, true];		
		_newUnit setVariable ["civLife", timeSpan, true];	
        	
        _newUnit addVest "V_Chestrig_blk";
		_newUnit doMove position player;

        _newUnit addEventHandler [ "handleDamage", {_this spawn civDamaged;} ];
		
		civUnits set [_civId, _newUnit];
        
		_newUnit
	};

	// Init CIVS array
	uiSleep 5;
	
	_co = 0;
	while {_co < civLimit} do {
	
		_cnt = createCenter EAST;
		_grp = createGroup EAST;
		_grp setBehaviour "CARELESS";

		civGroups set [_co, _grp];
	
		_tmp = [_co] call spawnCiv;
		_marker = format["mark%1", _co];
		createMarker [_marker, position _tmp ];
		_marker setMarkerType "mil_dot";
		_marker setMarkerColor "ColorPink";
		_marker setMarkerPos position _tmp;
		_co = _co + 1;
		uiSleep .05;
	};
	
    _co = 0;
	{
		_marker = format["plrM%1", _co];
		createMarker [_marker, position _x ];
		_marker setMarkerType "mil_dot";
		if (side _x == west) then {
        	_marker setMarkerColor "ColorBlue";    
        } else {
        	_marker setMarkerColor "ColorRed";
            civGroups set [count civGroups, _x];    
        };
		_marker setMarkerPos position _x;
        _co = _co + 1;
	} forEach playableUnits;
        
    
	execVM "server\civMarker.sqf";
	execVM "server\civMonitor_Move.sqf";
	execVM "server\civMonitor_Detonate.sqf";
	
	
	