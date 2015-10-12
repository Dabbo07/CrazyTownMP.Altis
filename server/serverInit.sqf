
	stopSpawningCivs = false;

	halfSpawnRange = spawnRange / 2;
	bufferSpawnRange = halfSpawnRange - 50;

	civGroups = [];
	civUnits = [];

civDamaged = {
	_unit = _this select 0;
	_selection = _this select 1;
	_damage = _this select 2;

	_unit setVariable ["explodeUnit", true, true];
	0
};

relocateCiv = {

    _civ = _this select 0;
    
    _civ setVariable ["civLife", timeSpan, true];
    
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
    _civ setPos [ _nx, _ny, 0.2 ];                        
};
        
        	
// Crate Setup

	clearMagazineCargoGlobal crateMP;
	clearWeaponCargoGlobal crateMP;
	clearItemCargoGlobal crateMP;

	crateMP addWeaponCargoGlobal ["srifle_EBR_F", 2];
	crateMP addMagazineCargoGlobal ["20Rnd_762x51_Mag", 8];

	crateMP addWeaponCargoGlobal ["arifle_Katiba_F", 2];
	crateMP addMagazineCargoGlobal ["30Rnd_65x39_caseless_green_mag_Tracer", 20];

	crateMP addWeaponCargoGlobal ["LMG_Mk200_F", 2];
	crateMP addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer", 20];

	crateMP addWeaponCargoGlobal ["arifle_MXC_F", 2];
	crateMP addWeaponCargoGlobal ["arifle_MXC_Black_F", 2];
	crateMP addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag_Tracer", 40];

	crateMP addItemCargoGlobal ["B_AssaultPack_mcamo", 4];
	crateMP addItemCargoGlobal ["Binocular", 4];
	crateMP addItemCargoGlobal ["ItemGPS", 4];

	crateMP addItemCargoGlobal ["FirstAidKit", 8];

	crateMP addItemCargoGlobal ["H_Bandanna_gry", 2];
	crateMP addItemCargoGlobal ["H_BandMask_reaper", 2];
	crateMP addItemCargoGlobal ["H_Beret_ocamo", 2];
	crateMP addItemCargoGlobal ["H_Booniehat_tan", 2];
	crateMP addItemCargoGlobal ["H_Cap_tan_specops_US", 2];
	crateMP addItemCargoGlobal ["H_CrewHelmetHeli_B", 2];
	crateMP addItemCargoGlobal ["H_HelmetIA", 2];
	crateMP addItemCargoGlobal ["H_HelmetSpecB", 2];
	crateMP addItemCargoGlobal ["H_StrawHat", 2];
	crateMP addItemCargoGlobal ["muzzle_snds_acp", 2];
	crateMP addItemCargoGlobal ["muzzle_snds_B", 2];
	crateMP addItemCargoGlobal ["muzzle_snds_H", 2];
	crateMP addItemCargoGlobal ["muzzle_snds_H_MG", 2];
	crateMP addItemCargoGlobal ["muzzle_snds_L", 2];
	crateMP addItemCargoGlobal ["muzzle_snds_M", 2];
	crateMP addItemCargoGlobal ["optic_Aco", 2];
	crateMP addItemCargoGlobal ["optic_Aco_grn", 2];
	crateMP addItemCargoGlobal ["optic_Aco_grn_smg", 2];
	crateMP addItemCargoGlobal ["optic_Aco_smg", 2];
	crateMP addItemCargoGlobal ["optic_Arco", 2];
	crateMP addItemCargoGlobal ["optic_Hamr", 2];
	crateMP addItemCargoGlobal ["optic_Holosight", 2];
	crateMP addItemCargoGlobal ["optic_Holosight_smg", 2];
	crateMP addItemCargoGlobal ["optic_MRCO", 2];
	crateMP addItemCargoGlobal ["optic_Nightstalker", 2];
	crateMP addItemCargoGlobal ["optic_NVS", 2];
	crateMP addItemCargoGlobal ["optic_SOS", 2];
	crateMP addItemCargoGlobal ["optic_tws", 2];
	crateMP addItemCargoGlobal ["optic_tws_mg", 2];
	crateMP addItemCargoGlobal ["V_BandollierB_blk", 2];
	crateMP addItemCargoGlobal ["V_BandollierB_cbr", 2];
	crateMP addItemCargoGlobal ["V_BandollierB_oli", 2];
	crateMP addItemCargoGlobal ["V_Chestrig_khk", 2];
	crateMP addItemCargoGlobal ["V_Chestrig_rgr", 2];
	crateMP addItemCargoGlobal ["V_HarnessO_brn", 2];
	crateMP addItemCargoGlobal ["V_HarnessOGL_gry", 2];
	crateMP addItemCargoGlobal ["V_PlateCarrier1_blk", 2];
	crateMP addItemCargoGlobal ["V_PlateCarrier1_rgr", 2];
	crateMP addItemCargoGlobal ["V_PlateCarrier2_rgr", 2];
	crateMP addItemCargoGlobal ["V_PlateCarrierGL_rgr", 2];
	crateMP addItemCargoGlobal ["V_PlateCarrierSpec_rgr", 2];
	crateMP addItemCargoGlobal ["V_TacVest_blk", 2];
	crateMP addItemCargoGlobal ["V_TacVest_blk_POLICE", 2];
	crateMP addItemCargoGlobal ["V_TacVest_brn", 2];
	crateMP addItemCargoGlobal ["V_TacVest_camo", 2];
	crateMP addItemCargoGlobal ["V_TacVestIR_blk", 2];

// Lock Spawn House Doors
	_spawnHouse = nearestBuilding getMarkerPos "spawnHouse";
	_doors = getNumber(configFile >> "cfgVehicles" >> (typeOf _spawnHouse) >> "numberOfDoors");
	for "_i" from 1 to _doors do {
		_spawnHouse setVariable[format["bis_disabled_Door_%1", _i],1, true];
	};

execVM "server\startGame.sqf";
