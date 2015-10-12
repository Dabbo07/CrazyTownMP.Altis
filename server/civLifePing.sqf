
	while {!stopSpawningCivs} do {

		_co = 0;
		while {_co < count civUnits} do {
            
            _unit = civUnits select _co;
            _unitLife = _unit getVariable ["civLife", timeSpan];
            if (_unitLife > 0) then {
                _unitLife = _unitLife - 1; 
                _unit setVariable ["civLife", _unitLife, true];
            };
            
            _co = _co + 1;
        };		

		uiSleep .8;
	};