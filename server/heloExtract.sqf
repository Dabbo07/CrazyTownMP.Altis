	[
		[ "TaskAssigned", "Await rescue from inbound helicopter" ],
		"showTask"
	] call BIS_fnc_MP;
	[
		[ "TaskSucceeded", "Get to Extraction site" ],
		"showTask"
	] call BIS_fnc_MP;

	_spawn = getMarkerPos "heloSpawn";
	_point1 = getMarkerPos "heloWP1";
	_point2 = getMarkerPos "heloWP2";
	_point3 = getMarkerPos "heloWP3";
	
	heloRescue = createVehicle ["B_Heli_Transport_01_camo_F", _spawn, [], 100, "FLY"];
	heloRescue setVelocity [0,0,0];

	heloRescue setPos [ getPos heloRescue select 0, getPos heloRescue select 1, (getPos heloRescue select  2)];
	heloRescue setDir markerDir "heloSpawn";

	heloGroup = createGroup WEST;
	heloPilot = heloGroup createUnit ["B_Pilot_F", [0,0,30], [], 0, "FORM"];
	heloPilot moveInDriver heloRescue;
	//heloCoPilot = heloGroup createUnit ["B_Pilot_F", [0,0,30], [], 0, "FORM"];
	//heloCoPilot moveInDriver heloRescue;
	heloCrew1 = heloGroup createUnit ["B_helicrew_F", [0,0,30], [], 0, "FORM"];
	heloCrew1 moveInGunner heloRescue;
	//heloCrew2 = heloGroup createUnit ["B_helicrew_F", [0,0,30], [], 0, "FORM"];
	//heloCrew2 moveInGunner heloRescue;
	
	heloGroup selectLeader heloPilot;

	_wp0 = heloGroup addWaypoint [ _point1, 50];	
	_wp0 setWaypointType "MOVE";
	_wp0 setWaypointBehaviour "CARELESS";
	_wp0 setWaypointCombatMode "RED";
	_wp0 setWaypointSpeed "FULL";
	
	_wp1 = heloGroup addWaypoint [ _point2, 50];
	_wp1 setWaypointStatements ["", "heloRescue land ""GET IN"""];
	_wp1 setWaypointType "MOVE";
	_wp1 setWaypointBehaviour "CARELESS";
	_wp1 setWaypointCombatMode "RED";
	_wp1 setWaypointSpeed "NORMAL";

	_ready = false;
	while {!_ready} do {
		_heloCo = 0;
		{
			if (_x in crew heloRescue) then {
				_heloCo = _heloCo + 1;
			};
		} forEach playableUnits;		
		if (_heloCo == count playableUnits) then {
			_ready = true;
		};
		uiSleep .1;
	};

	stopSpawningCivs = true;
	[
		[ "TaskSucceeded", "Board helicopter" ],
		"showTask"
	] call BIS_fnc_MP;

	_wp2 = heloGroup addWaypoint [getMarkerPos "Exfil", 50];
	_wp2 setWaypointType "TR UNLOAD";
	_wp2 setWaypointStatements ["", "heloRescue land ""GET OUT"""];
	_wp2 setWaypointBehaviour "CARELESS";
	_wp2 setWaypointCombatMode "RED";
	_wp2 setWaypointSpeed "FULL";

	uiSleep 15;
	
	[
		[],
		"stopGameSuccess"
	] call BIS_fnc_MP;
	uiSleep 22;
	endMission "END1";
	