
spawnRange = (paramsArray select 0);
civLimit = (paramsArray select 1);
timeSpan = (paramsArray select 2);
detRange = (paramsArray select 3);
playerSpawnTime = (paramsArray select 4);
//civsLifeSpan = floor(timeSpan / (0.2 * civLimit));
civsLifeSpan = 40;

myTrigger = 0;

// Server init
if (isServer) then {
	// Server specific tasks
	execVM "server\serverInit.sqf";
};
if (!isServer || !(isNull player)) then {
	// Listen Server + Client only tasks
	execVM "client\clientInit.sqf";
};


// Global Functions

getTarget = {
	_sel = t1;
	if (count playableUnits > 0) then {
        _timeout = (count playableUnits) * 2;
        while {side _sel != west && _timeout > 0} do {
        	_sel = playableUnits select (floor (random count playableUnits));
            _timeout = _timeout - 1;
        };
	};
	_sel
};
