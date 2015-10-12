// Wait until players pass briefing screen. (Map trigger, trig1)
	while { myTrigger == 0} do {
		uiSleep 1;
	};

// Count Down displayed on player's screen.
	uiSleep 6.5;
	
	_countDown = playerSpawnTime;
	while {_countDown > -1} do {
		uiSleep 1.1;
		[
			[ _countDown ],
			"countDown"
		] call BIS_fnc_MP;
		_countDown = _countDown - 1;
	};

// UnLock House
	_spawnHouse = nearestBuilding getMarkerPos "spawnHouse";
	_doors = getNumber(configFile >> "cfgVehicles" >> (typeOf _spawnHouse) >> "numberOfDoors");
	for "_i" from 1 to _doors do {
		_spawnHouse setVariable[format["bis_disabled_Door_%1", _i],0, true];
	};

	uiSleep 1;
	[
		[ "TaskAssigned", "Secure transport" ],
		"showTask"
	] call BIS_fnc_MP;
	[
		[ "TaskAssigned", "Get to Extraction site" ],
		"showTask"
	] call BIS_fnc_MP;
	[
		[ "TaskAssigned", "Escape Crazy Town" ],
		"showTask"
	] call BIS_fnc_MP;
	[
		[ "TaskAssigned", "Stop BlueFor from escaping!" ],
		"showBomberTask"
	] call BIS_fnc_MP;
    	
// Remove crate? and weapons
	clearMagazineCargoGlobal crateMP;
	clearWeaponCargoGlobal crateMP;
	clearItemCargoGlobal crateMP;

	execVM "server\civSpawner.sqf";
	