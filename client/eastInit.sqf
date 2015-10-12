// Pause scripts until map screen finished.
while { myTrigger == 0 } do {
	uiSleep 1;
};

	stopGameSuccess = {
		["TaskFailed",["A","Stop BlueFor from escaping!"]] call bis_fnc_showNotification;
		uiSleep 20;
		endMission "END1";
	};
	stopGameFailed = {
		["TaskSucceeded",["A","Stop BlueFor from escaping!"]] call bis_fnc_showNotification;
		uiSleep 5;
		endMission "END1";
	};

	showTask = { };
    
	showBomberTask = {
		_typ = _this select 0;
		_msg = _this select 1;
		[_typ,["A",_msg]] call bis_fnc_showNotification;
	};
    	
	countDown = {
		// TODO: Add sounds!
		_count = _this select 0;
		if (_count < 1) then {
			[
				"<t color='#ff0000' align='center' shadow='1' size='1.2'>GAME STARTED<br/>RESPAWNING NOW...</t>",
				0, 0,
				8, 0
			] spawn BIS_fnc_dynamicText;
            player call localCivDamaged;
            uiSleep 3;
            execVM "client\bomberProximityMonitor.sqf";
		} else {
			if (_count < 10) then {
				[
					format["<t color='#ff0000' align='center' shadow='1' size='1.2'>Starting in %1...</t>", _count],
					0, -0.15,
					0.5, 0
				] spawn BIS_fnc_dynamicText;
			} else {
				if (_count < 20) then {
					[
						format["<t color='#ffff00' align='center' shadow='1' size='1.2'>Starting in %1...</t>", _count],
						0, -0.15,
						0.5, 0
					] spawn BIS_fnc_dynamicText;
				} else {
					[
						format["<t color='#f0f0f0' align='center' shadow='1' size='0.75'>Please wait for opposition to get ready<br/>Game will start in %1s...</t>", _count],
						0, -0.15,
						0.5, 0
					] spawn BIS_fnc_dynamicText;
				};
			};
		};
	};

    player enableFatigue false;
    
    removeAllWeapons player;
    player addItem "ItemGPS";
    player assignItem "ItemGPS";
    player addVest "V_Chestrig_blk";
    
    player addEventHandler [ "handleDamage", {_this spawn localCivDamaged;} ];
    
    
