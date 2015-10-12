
	playerLifeSpan = timeSpan;

	// Functions

	playerDebug = {
		_msg = _this select 0;
		player globalChat _msg;
	};


	localCivDamaged = {
		_kx = getPos player select 0;
		_ky = getPos player select 1;
		"R_PG32V_F" createVehicle [_kx, _ky, 0.5];
                
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
	    player setPos [ _nx, _ny, 0.2 ];
        playerLifeSpan = timeSpan;                      
    };

	if (side player == east) then {
        execVM "client\eastInit.sqf";
    } else {
      	execVM "client\westInit.sqf";  
    };

	[
		"<t align='center' shadow='1' size='1.2'>Welcome to Crazy Town</t><br/><t align='center' shadow='1' size='0.5'>Version 1.20</t><br/><br/><br/><br/><t align='center' shadow='1' size='0.6'>Game will start shortly...</t>",
		0, 0,
		3, 1
	] spawn BIS_fnc_dynamicText;