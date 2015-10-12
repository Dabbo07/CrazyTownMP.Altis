// Pause scripts until map screen finished.
while { myTrigger == 0 } do {
	uiSleep 1;
};

	stopGameSuccess = {
		["TaskSucceeded",["A","Escape Crazy Town"]] call bis_fnc_showNotification;
		uiSleep 20;
		endMission "END1";
	};
	stopGameFailed = {
		["TaskFailed",["A","Escape Crazy Town"]] call bis_fnc_showNotification;
		uiSleep 5;
		endMission "END1";
	};

	showTask = {
		_typ = _this select 0;
		_msg = _this select 1;
		[_typ,["A",_msg]] call bis_fnc_showNotification;
	};
	showBomberTask = { };
    	
	countDown = {
		// TODO: Add sounds!
		_count = _this select 0;
		if (_count < 1) then {
			[
				"<t color='#ff0000' align='center' shadow='1' size='1.2'>GAME STARTED<br/>Doors unlocked!</t>",
				0, -0.25,
				8, 0
			] spawn BIS_fnc_dynamicText;
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
						format["<t color='#f0f0f0' align='center' shadow='1' size='0.75'>Prepare your loadouts!<br/>Game will start in %1s...</t>", _count],
						0, -0.15,
						0.5, 0
					] spawn BIS_fnc_dynamicText;
				};
			};
		};
	};

