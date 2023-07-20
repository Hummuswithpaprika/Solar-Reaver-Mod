/*
	Author: Waagheur

	Description:
		Help! I am missing!
		
	Parameter(s):
		None




	Returns:
		Nothing

	Examples:
		
*/

params [];

if (not(isDedicated)) then {
	
	/**	
	_plasma_weapons = [
		"SR_Master_Crafted_Ragefire_PlasmaGun_1", 
		"SR_Ragefire_Plasma_Gun", 
		"SR_Ryza_Plasma_Gun", 
		"SR_Combi_Bolter_1", 
		"SR_Combi_Bolter_2", 
		"SR_Combi_Bolter_3",
		"STEVE_TigComb_Plasma_1"
	];

	_plasma_muzzles = [
		"SR_Master_Crafted_Ragefire_PlasmaGun_1", 
		"SR_Ragefire_Plasma_Gun", 
		"SR_Ryza_Plasma_Gun", 
		"SR_Ryza_Plasma_Pistol",
		"TIOW_SM_Under_Plas_1",
		"Steve_30k_Under_Plasma"
	];

	_plasma_pistol_weapons = [
		"SR_Ryza_Plasma_Pistol"
	];
	*/

	if ("SR_Master_Crafted_Ragefire_PlasmaGun_1" in (weapons player)) then {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Master_Crafted_Ragefire_PlasmaGun_1"], -1]) == -1) then {
			missionNamespace setVariable [format ["%1_handler","SR_Master_Crafted_Ragefire_PlasmaGun_1"], player addEventHandler ["FiredMan", {
				// params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
				_weapon = (_this select 1);
				if (_weapon == "SR_Master_Crafted_Ragefire_PlasmaGun_1") then {
					_ammo = player ammo _weapon;
					_projectile = (_this select 6);
					_mode = (_this select 3);
					if (_mode == "Overcharge") then {
						
						//Overcharge consummes 10 shots
						if (_ammo > 8) then {
							player setAmmo [_weapon, _ammo - 9];
							
							_position = getPosWorld _projectile;
							_dirAndUp = [vectorDir _projectile, vectorUp _projectile];
							_velocity = velocity _projectile;
							
							deleteVehicle _projectile;
							
							_projectile = "SR_Overcharge_PlasmagunRound" createVehicle [0,0,0];
							_projectile setPosWorld _position;
							_projectile setVectorDirAndUp _dirAndUp;
							_projectile setVelocityModelSpace [0, 1140, 0];
							
							missionNamespace setVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"],0]) 
								+ ([30, 50] call BIS_fnc_randomInt)];
							
						}
						else { // Not enough ammo for overcharge, fire normally
							// Regular shot, increase heat
							missionNamespace setVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"],0]) 
								+ ([2, 5] call BIS_fnc_randomInt)];
						};
					}
					else {
						// Regular shot, increase heat
						missionNamespace setVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"],0]) 
							+ ([2, 5] call BIS_fnc_randomInt)];
					};
					
					// Check for overheat
					if ((missionNamespace getVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"],0]) > 100) then {
						[] spawn {
							overheat = player addAction ["Weapon lock on", 
								{hintSilent "Weapon overheating";}, [], 0, false, false, "DefaultAction", 
								"'SR_Master_Crafted_Ragefire_PlasmaGun_1' == (currentMuzzle player)"];
							while {(missionNamespace getVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"],0]) > 0} do {
								sleep 1;
							};
							player removeAction overheat;
						};
					};
				};
				
			}]];
			
			// Spawn cooler
			[] spawn {
				while {(missionNamespace getVariable [format ["%1_handler","SR_Master_Crafted_Ragefire_PlasmaGun_1"], -1]) != -1} do {
					// Reduce heat if possible
					if (((missionNamespace getVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"],0]) - 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Master_Crafted_Ragefire_PlasmaGun_1" >> "plasmaCoolingMult")) > 0) then {
						missionNamespace setVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"],0]) 
							- 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Master_Crafted_Ragefire_PlasmaGun_1" >> "plasmaCoolingMult")];
					}
					else {
						(missionNamespace setVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"],0])
					};
					
					// Display new heat if weapon is the current weapon
					if ("SR_Master_Crafted_Ragefire_PlasmaGun_1" == (currentWeapon player)) then {
						if ((missionNamespace getVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"],0]) > 0) then {
							_text =
								"[TSR] [Master Crafted] Ragefire Plasmagun" 
								+ "<br/>"
								+ "Current heat : " + str(missionNamespace getVariable [format ["%1_heat","SR_Master_Crafted_Ragefire_PlasmaGun_1"],0]);
							10 cutText [
								format["<t align='right'>%1</t>",_text], 
							"PLAIN", 0, false, true];
						};
					};
					sleep 2;
				};
			};
		};
	}
	else {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Master_Crafted_Ragefire_PlasmaGun_1"], -1]) != -1) then {
			player removeEventHandler ["FiredMan", (missionNamespace getVariable [format ["%1_handler","SR_Master_Crafted_Ragefire_PlasmaGun_1"], -1])];
			missionNamespace setVariable [format ["%1_handler","SR_Master_Crafted_Ragefire_PlasmaGun_1"], -1];
		};
	};
	
	if ("SR_Ragefire_Plasma_Gun" in (weapons player)) then {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Ragefire_Plasma_Gun"], -1]) == -1) then {
			missionNamespace setVariable [format ["%1_handler","SR_Ragefire_Plasma_Gun"], player addEventHandler ["FiredMan", {
				// params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
				_weapon = (_this select 1);
				if (_weapon == "SR_Ragefire_Plasma_Gun") then {
					_ammo = player ammo _weapon;
					_projectile = (_this select 6);
					_mode = (_this select 3);
					if (_mode == "Overcharge") then {
						
						//Overcharge consummes 10 shots
						if (_ammo > 8) then {
							player setAmmo [_weapon, _ammo - 9];
							
							_position = getPosWorld _projectile;
							_dirAndUp = [vectorDir _projectile, vectorUp _projectile];
							_velocity = velocity _projectile;
							
							deleteVehicle _projectile;
							
							_projectile = "SR_Overcharge_PlasmagunRound" createVehicle [0,0,0];
							_projectile setPosWorld _position;
							_projectile setVectorDirAndUp _dirAndUp;
							_projectile setVelocityModelSpace [0, 1140, 0];
							
							missionNamespace setVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"],0]) 
								+ ([30, 50] call BIS_fnc_randomInt)];
							
						}
						else { // Not enough ammo for overcharge, fire normally
							// Regular shot, increase heat
							missionNamespace setVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"],0]) 
								+ ([2, 5] call BIS_fnc_randomInt)];
						};
					}
					else {
						// Regular shot, increase heat
						missionNamespace setVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"],0]) 
							+ ([2, 5] call BIS_fnc_randomInt)];
					};
					
					// Check for overheat
					if ((missionNamespace getVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"],0]) > 100) then {
						[] spawn {
							overheat = player addAction ["Weapon lock on", 
								{hintSilent "Weapon overheating";}, [], 0, false, false, "DefaultAction", 
								"'SR_Ragefire_Plasma_Gun' == (currentMuzzle player)"];
							while {(missionNamespace getVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"],0]) > 0} do {
								sleep 1;
							};
							player removeAction overheat;
						};
					};
				};
				
			}]];
			
			// Spawn cooler
			[] spawn {
				while {(missionNamespace getVariable [format ["%1_handler","SR_Ragefire_Plasma_Gun"], -1]) != -1} do {
					// Reduce heat if possible
					if (((missionNamespace getVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"],0]) - 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Ragefire_Plasma_Gun" >> "plasmaCoolingMult")) > 0) then {
						missionNamespace setVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"],0]) 
							- 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Ragefire_Plasma_Gun" >> "plasmaCoolingMult")];
					}
					else {
						(missionNamespace setVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"],0])
					};
					
					// Display new heat if weapon is the current weapon
					if ("SR_Ragefire_Plasma_Gun" == (currentWeapon player)) then {
						if ((missionNamespace getVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"],0]) > 0) then {
							_text =
								"[TSR] Ragefire Plasma Gun" 
								+ "<br/>"
								+ "Current heat : " + str(missionNamespace getVariable [format ["%1_heat","SR_Ragefire_Plasma_Gun"],0]);
							10 cutText [
								format["<t align='right'>%1</t>",_text], 
							"PLAIN", 0, false, true];
						};
					};
					sleep 2;
				};
			};
		};
	}
	else {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Ragefire_Plasma_Gun"], -1]) != -1) then {
			player removeEventHandler ["FiredMan", (missionNamespace getVariable [format ["%1_handler","SR_Ragefire_Plasma_Gun"], -1])];
			missionNamespace setVariable [format ["%1_handler","SR_Ragefire_Plasma_Gun"], -1];
		};
	};
	
	if ("SR_Ryza_Plasma_Gun" in (weapons player)) then {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Ryza_Plasma_Gun"], -1]) == -1) then {
			missionNamespace setVariable [format ["%1_handler","SR_Ryza_Plasma_Gun"], player addEventHandler ["FiredMan", {
				// params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
				_weapon = (_this select 1);
				if (_weapon == "SR_Ryza_Plasma_Gun") then {
					_ammo = player ammo _weapon;
					_projectile = (_this select 6);
					_mode = (_this select 3);
					if (_mode == "Overcharge") then {
						
						//Overcharge consummes 10 shots
						if (_ammo > 8) then {
							player setAmmo [_weapon, _ammo - 9];
							
							_position = getPosWorld _projectile;
							_dirAndUp = [vectorDir _projectile, vectorUp _projectile];
							_velocity = velocity _projectile;
							
							deleteVehicle _projectile;
							
							_projectile = "SR_Overcharge_PlasmagunRound" createVehicle [0,0,0];
							_projectile setPosWorld _position;
							_projectile setVectorDirAndUp _dirAndUp;
							_projectile setVelocityModelSpace [0, 1140, 0];
							
							missionNamespace setVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"],0]) 
								+ ([30, 50] call BIS_fnc_randomInt)];
							
						}
						else { // Not enough ammo for overcharge, fire normally
							// Regular shot, increase heat
							missionNamespace setVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"],0]) 
								+ ([2, 5] call BIS_fnc_randomInt)];
						};
					}
					else {
						// Regular shot, increase heat
						missionNamespace setVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"],0]) 
							+ ([2, 5] call BIS_fnc_randomInt)];
					};
					
					// Check for overheat
					if ((missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"],0]) > 100) then {
						[] spawn {
							overheat = player addAction ["Weapon lock on", 
								{hintSilent "Weapon overheating";}, [], 0, false, false, "DefaultAction", 
								"'SR_Ryza_Plasma_Gun' == (currentMuzzle player)"];
							while {(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"],0]) > 0} do {
								sleep 1;
							};
							player removeAction overheat;
						};
					};
				};
				
			}]];
			
			// Spawn cooler
			[] spawn {
				while {(missionNamespace getVariable [format ["%1_handler","SR_Ryza_Plasma_Gun"], -1]) != -1} do {
					// Reduce heat if possible
					if (((missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"],0]) - 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Ryza_Plasma_Gun" >> "plasmaCoolingMult")) > 0) then {
						missionNamespace setVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"],0]) 
							- 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Ryza_Plasma_Gun" >> "plasmaCoolingMult")];
					}
					else {
						(missionNamespace setVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"],0])
					};
					
					// Display new heat if weapon is the current weapon
					if ("SR_Ryza_Plasma_Gun" == (currentWeapon player)) then {
						if ((missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"],0]) > 0) then {
							_text =
								"[TSR] Ryza Thunderbolt Plasmagun" 
								+ "<br/>"
								+ "Current heat : " + str(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Gun"],0]);
							10 cutText [
								format["<t align='right'>%1</t>",_text], 
							"PLAIN", 0, false, true];
						};
					};
					sleep 2;
				};
			};
		};
	}
	else {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Ryza_Plasma_Gun"], -1]) != -1) then {
			player removeEventHandler ["FiredMan", (missionNamespace getVariable [format ["%1_handler","SR_Ryza_Plasma_Gun"], -1])];
			missionNamespace setVariable [format ["%1_handler","SR_Ryza_Plasma_Gun"], -1];
		};
	};
	
	if ("SR_Combi_Bolter_1" in (weapons player)) then {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_1"], -1]) == -1) then {
			missionNamespace setVariable [format ["%1_handler","SR_Combi_Bolter_1"], player addEventHandler ["FiredMan", {
				// params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
				_weapon = (_this select 1);
				if ((_this select 2) == "TIOW_SM_Under_Plas_1") then {
					_ammo = player ammo (_this select 2);
					_projectile = (_this select 6);
					_mode = (_this select 3);
					if (_mode == "Overcharge") then {
						
						//Overcharge consummes 10 shots
						if (_ammo > 8) then {
							player setAmmo [(_this select 2), _ammo - 9];
							
							_position = getPosWorld _projectile;
							_dirAndUp = [vectorDir _projectile, vectorUp _projectile];
							_velocity = velocity _projectile;
							
							deleteVehicle _projectile;
							
							_projectile = "SR_Overcharge_PlasmagunRound" createVehicle [0,0,0];
							_projectile setPosWorld _position;
							_projectile setVectorDirAndUp _dirAndUp;
							_projectile setVelocityModelSpace [0, 1140, 0];
							
							missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_1"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_1"],0]) 
								+ ([30, 50] call BIS_fnc_randomInt)];
							
						}
						else { // Not enough ammo for overcharge, fire normally
							// Regular shot, increase heat
							missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_1"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_1"],0]) 
								+ ([2, 5] call BIS_fnc_randomInt)];
						};
					}
					else {
						// Regular shot, increase heat
						missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_1"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_1"],0]) 
							+ ([2, 5] call BIS_fnc_randomInt)];
					};
					
					// Check for overheat
					if ((missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_1"],0]) > 100) then {
						[] spawn {
							overheat = player addAction ["Weapon lock on", 
								{hintSilent "Weapon overheating";}, [], 0, false, false, "DefaultAction", 
								"'TIOW_SM_Under_Plas_1' == (currentMuzzle player)"];
							while {(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_1"],0]) > 0} do {
								sleep 1;
							};
							player removeAction overheat;
						};
					};
				};
				
			}]];
			
			// Spawn cooler
			[] spawn {
				while {(missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_1"], -1]) != -1} do {
					// Reduce heat if possible
					if (((missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_1"],0]) - 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Combi_Bolter_1" >> "plasmaCoolingMult")) > 0) then {
						missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_1"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_1"],0]) 
							- 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Combi_Bolter_1" >> "plasmaCoolingMult")];
					}
					else {
						(missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_1"],0])
					};
					
					// Display new heat if weapon is the current weapon
					if ("SR_Combi_Bolter_1" == (currentWeapon player)) then {
						if ((missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_1"],0]) > 0) then {
							_text =
								"[TSR] Bolter Combi-Plasma (Black)" 
								+ "<br/>"
								+ "Current heat : " + str(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_1"],0]);
							10 cutText [
								format["<t align='right'>%1</t>",_text], 
							"PLAIN", 0, false, true];
						};
					};
					sleep 2;
				};
			};
		};
	}
	else {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_1"], -1]) != -1) then {
			player removeEventHandler ["FiredMan", (missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_1"], -1])];
			missionNamespace setVariable [format ["%1_handler","SR_Combi_Bolter_1"], -1];
		};
	};
	
	if ("SR_Combi_Bolter_2" in (weapons player)) then {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_2"], -1]) == -1) then {
			missionNamespace setVariable [format ["%1_handler","SR_Combi_Bolter_2"], player addEventHandler ["FiredMan", {
				// params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
				_weapon = (_this select 1);
				if ((_this select 2) == "TIOW_SM_Under_Plas_1") then {
					_ammo = player ammo (_this select 2);
					_projectile = (_this select 6);
					_mode = (_this select 3);
					if (_mode == "Overcharge") then {
						
						//Overcharge consummes 10 shots
						if (_ammo > 8) then {
							player setAmmo [(_this select 2), _ammo - 9];
							
							_position = getPosWorld _projectile;
							_dirAndUp = [vectorDir _projectile, vectorUp _projectile];
							_velocity = velocity _projectile;
							
							deleteVehicle _projectile;
							
							_projectile = "SR_Overcharge_PlasmagunRound" createVehicle [0,0,0];
							_projectile setPosWorld _position;
							_projectile setVectorDirAndUp _dirAndUp;
							_projectile setVelocityModelSpace [0, 1140, 0];
							
							missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_2"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_2"],0]) 
								+ ([30, 50] call BIS_fnc_randomInt)];
							
						}
						else { // Not enough ammo for overcharge, fire normally
							// Regular shot, increase heat
							missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_2"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_2"],0]) 
								+ ([2, 5] call BIS_fnc_randomInt)];
						};
					}
					else {
						// Regular shot, increase heat
						missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_2"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_2"],0]) 
							+ ([2, 5] call BIS_fnc_randomInt)];
					};
					
					// Check for overheat
					if ((missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_2"],0]) > 100) then {
						[] spawn {
							overheat = player addAction ["Weapon lock on", 
								{hintSilent "Weapon overheating";}, [], 0, false, false, "DefaultAction", 
								"'TIOW_SM_Under_Plas_1' == (currentMuzzle player)"];
							while {(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_2"],0]) > 0} do {
								sleep 1;
							};
							player removeAction overheat;
						};
					};
				};
				
			}]];
			
			// Spawn cooler
			[] spawn {
				while {(missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_2"], -1]) != -1} do {
					// Reduce heat if possible
					if (((missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_2"],0]) - 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Combi_Bolter_2" >> "plasmaCoolingMult")) > 0) then {
						missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_2"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_2"],0]) 
							- 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Combi_Bolter_2" >> "plasmaCoolingMult")];
					}
					else {
						(missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_2"],0])
					};
					
					// Display new heat if weapon is the current weapon
					if ("SR_Combi_Bolter_2" == (currentWeapon player)) then {
						if ((missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_2"],0]) > 0) then {
							_text =
								"[TSR] Bolter Combi-Plasma (Red)" 
								+ "<br/>"
								+ "Current heat : " + str(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_2"],0]);
							10 cutText [
								format["<t align='right'>%1</t>",_text], 
							"PLAIN", 0, false, true];
						};
					};
					sleep 2;
				};
			};
		};
	}
	else {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_2"], -1]) != -1) then {
			player removeEventHandler ["FiredMan", (missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_2"], -1])];
			missionNamespace setVariable [format ["%1_handler","SR_Combi_Bolter_2"], -1];
		};
	};
	
	if ("SR_Combi_Bolter_3" in (weapons player)) then {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_3"], -1]) == -1) then {
			missionNamespace setVariable [format ["%1_handler","SR_Combi_Bolter_3"], player addEventHandler ["FiredMan", {
				// params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
				_weapon = (_this select 1);
				if ((_this select 2) == "TIOW_SM_Under_Plas_1") then {
					_ammo = player ammo (_this select 2);
					_projectile = (_this select 6);
					_mode = (_this select 3);
					if (_mode == "Overcharge") then {
						
						//Overcharge consummes 10 shots
						if (_ammo > 8) then {
							player setAmmo [(_this select 2), _ammo - 9];
							
							_position = getPosWorld _projectile;
							_dirAndUp = [vectorDir _projectile, vectorUp _projectile];
							_velocity = velocity _projectile;
							
							deleteVehicle _projectile;
							
							_projectile = "SR_Overcharge_PlasmagunRound" createVehicle [0,0,0];
							_projectile setPosWorld _position;
							_projectile setVectorDirAndUp _dirAndUp;
							_projectile setVelocityModelSpace [0, 1140, 0];
							
							missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_3"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_3"],0]) 
								+ ([30, 50] call BIS_fnc_randomInt)];
							
						}
						else { // Not enough ammo for overcharge, fire normally
							// Regular shot, increase heat
							missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_3"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_3"],0]) 
								+ ([2, 5] call BIS_fnc_randomInt)];
						};
					}
					else {
						// Regular shot, increase heat
						missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_3"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_3"],0]) 
							+ ([2, 5] call BIS_fnc_randomInt)];
					};
					
					// Check for overheat
					if ((missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_3"],0]) > 100) then {
						[] spawn {
							overheat = player addAction ["Weapon lock on", 
								{hintSilent "Weapon overheating";}, [], 0, false, false, "DefaultAction", 
								"'TIOW_SM_Under_Plas_1' == (currentMuzzle player)"];
							while {(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_3"],0]) > 0} do {
								sleep 1;
							};
							player removeAction overheat;
						};
					};
				};
				
			}]];
			
			// Spawn cooler
			[] spawn {
				while {(missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_3"], -1]) != -1} do {
					// Reduce heat if possible
					if (((missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_3"],0]) - 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Combi_Bolter_3" >> "plasmaCoolingMult")) > 0) then {
						missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_3"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_3"],0]) 
							- 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Combi_Bolter_3" >> "plasmaCoolingMult")];
					}
					else {
						(missionNamespace setVariable [format ["%1_heat","SR_Combi_Bolter_3"],0])
					};
					
					// Display new heat if weapon is the current weapon
					if ("SR_Combi_Bolter_3" == (currentWeapon player)) then {
						if ((missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_3"],0]) > 0) then {
							_text =
								"[TSR] Bolter Combi-Plasma (White)" 
								+ "<br/>"
								+ "Current heat : " + str(missionNamespace getVariable [format ["%1_heat","SR_Combi_Bolter_3"],0]);
							10 cutText [
								format["<t align='right'>%1</t>",_text], 
							"PLAIN", 0, false, true];
						};
					};
					sleep 2;
				};
			};
		};
	}
	else {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_3"], -1]) != -1) then {
			player removeEventHandler ["FiredMan", (missionNamespace getVariable [format ["%1_handler","SR_Combi_Bolter_3"], -1])];
			missionNamespace setVariable [format ["%1_handler","SR_Combi_Bolter_3"], -1];
		};
	};
	
	if ("SR_Tig_Combi_Bolter" in (weapons player)) then {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Tig_Combi_Bolter"], -1]) == -1) then {
			missionNamespace setVariable [format ["%1_handler","SR_Tig_Combi_Bolter"], player addEventHandler ["FiredMan", {
				// params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
				_weapon = (_this select 1);
				if ((_this select 2) == "Steve_30k_Under_Plasma") then {
					_ammo = player ammo (_this select 2);
					_projectile = (_this select 6);
					_mode = (_this select 3);
					if (_mode == "Overcharge") then {
						
						//Overcharge consummes 10 shots
						if (_ammo > 8) then {
							player setAmmo [(_this select 2), _ammo - 9];
							
							_position = getPosWorld _projectile;
							_dirAndUp = [vectorDir _projectile, vectorUp _projectile];
							_velocity = velocity _projectile;
							
							deleteVehicle _projectile;
							
							_projectile = "SR_Overcharge_PlasmagunRound" createVehicle [0,0,0];
							_projectile setPosWorld _position;
							_projectile setVectorDirAndUp _dirAndUp;
							_projectile setVelocityModelSpace [0, 1140, 0];
							
							missionNamespace setVariable [format ["%1_heat","SR_Tig_Combi_Bolter"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Tig_Combi_Bolter"],0]) 
								+ ([30, 50] call BIS_fnc_randomInt)];
							
						}
						else { // Not enough ammo for overcharge, fire normally
							// Regular shot, increase heat
							missionNamespace setVariable [format ["%1_heat","SR_Tig_Combi_Bolter"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Tig_Combi_Bolter"],0]) 
								+ ([2, 5] call BIS_fnc_randomInt)];
						};
					}
					else {
						// Regular shot, increase heat
						missionNamespace setVariable [format ["%1_heat","SR_Tig_Combi_Bolter"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Tig_Combi_Bolter"],0]) 
							+ ([2, 5] call BIS_fnc_randomInt)];
					};
					
					// Check for overheat
					if ((missionNamespace getVariable [format ["%1_heat","SR_Tig_Combi_Bolter"],0]) > 100) then {
						[] spawn {
							overheat = player addAction ["Weapon lock on", 
								{hintSilent "Weapon overheating";}, [], 0, false, false, "DefaultAction", 
								"'Steve_30k_Under_Plasma' == (currentMuzzle player)"];
							while {(missionNamespace getVariable [format ["%1_heat","SR_Tig_Combi_Bolter"],0]) > 0} do {
								sleep 1;
							};
							player removeAction overheat;
						};
					};
				};
				
			}]];
			
			// Spawn cooler
			[] spawn {
				while {(missionNamespace getVariable [format ["%1_handler","SR_Tig_Combi_Bolter"], -1]) != -1} do {
					// Reduce heat if possible
					if (((missionNamespace getVariable [format ["%1_heat","SR_Tig_Combi_Bolter"],0]) - 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Tig_Combi_Bolter" >> "plasmaCoolingMult")) > 0) then {
						missionNamespace setVariable [format ["%1_heat","SR_Tig_Combi_Bolter"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Tig_Combi_Bolter"],0]) 
							- 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Tig_Combi_Bolter" >> "plasmaCoolingMult")];
					}
					else {
						(missionNamespace setVariable [format ["%1_heat","SR_Tig_Combi_Bolter"],0])
					};
					
					// Display new heat if weapon is the current weapon
					if ("SR_Tig_Combi_Bolter" == (currentWeapon player)) then {
						if ((missionNamespace getVariable [format ["%1_heat","SR_Tig_Combi_Bolter"],0]) > 0) then {
							_text =
								"[TSR] Tigrus Pattern Combi-Plasma" 
								+ "<br/>"
								+ "Current heat : " + str(missionNamespace getVariable [format ["%1_heat","SR_Tig_Combi_Bolter"],0]);
							10 cutText [
								format["<t align='right'>%1</t>",_text], 
							"PLAIN", 0, false, true];
						};
					};
					sleep 2;
				};
			};
		};
	}
	else {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Tig_Combi_Bolter"], -1]) != -1) then {
			player removeEventHandler ["FiredMan", (missionNamespace getVariable [format ["%1_handler","SR_Tig_Combi_Bolter"], -1])];
			missionNamespace setVariable [format ["%1_handler","SR_Tig_Combi_Bolter"], -1];
		};
	};
	
	if ("SR_Ryza_Plasma_Pistol" in (weapons player)) then {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Ryza_Plasma_Pistol"], -1]) == -1) then {
			missionNamespace setVariable [format ["%1_handler","SR_Ryza_Plasma_Pistol"], player addEventHandler ["FiredMan", {
				// params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
				_weapon = (_this select 1);
				
				if (_weapon == "SR_Ryza_Plasma_Pistol") then {
					_ammo = player ammo _weapon;
					_projectile = (_this select 6);
					_mode = (_this select 3);
					if (_mode == "Overcharge") then {
						
						//Overcharge consummes 7 shots
						if (_ammo > 5) then {
							player setAmmo [_weapon, _ammo - 6];
							
							_position = getPosWorld _projectile;
							_dirAndUp = [vectorDir _projectile, vectorUp _projectile];
							_velocity = velocity _projectile;
							
							deleteVehicle _projectile;
							
							_projectile = "SR_Overcharge_PlasmapistolRound" createVehicle [0,0,0];
							_projectile setPosWorld _position;
							_projectile setVectorDirAndUp _dirAndUp;
							_projectile setVelocityModelSpace [0, 1140, 0];
							
							missionNamespace setVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"],0]) 
								+ ([40, 60] call BIS_fnc_randomInt)];
							
						}
						else { // Not enough ammo for overcharge, fire normally
							// Regular shot, increase heat
							missionNamespace setVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"], 
								(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"],0]) 
								+ ([4, 8] call BIS_fnc_randomInt)];
						};
					}
					else {
						// Regular shot, increase heat
						missionNamespace setVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"],0]) 
							+ ([4, 8] call BIS_fnc_randomInt)];
					};
					
					// Check for overheat
					if ((missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"],0]) > 100) then {
						[] spawn {
							overheat = player addAction ["Weapon lock on", 
								{hintSilent "Weapon overheating";}, [], 0, false, false, "DefaultAction", 
								"'SR_Ryza_Plasma_Pistol' == (currentMuzzle player)"];
							while {(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"],0]) > 0} do {
								sleep 1;
							};
							player removeAction overheat;
						};
					};
				};
				
			}]];
			
			// Spawn cooler
			[] spawn {
				while {(missionNamespace getVariable [format ["%1_handler","SR_Ryza_Plasma_Pistol"], -1]) != -1} do {
					// Reduce heat if possible
					if (((missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"],0]) - 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Ryza_Plasma_Pistol" >> "plasmaCoolingMult")) > 0) then {
						missionNamespace setVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"], 
							(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"],0]) 
							- 2 * getNumber (configFile >> "CfgWeapons" >> "SR_Ryza_Plasma_Pistol" >> "plasmaCoolingMult")];
					}
					else {
						(missionNamespace setVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"],0])
					};
					
					// Display new heat if weapon is the current weapon
					if ("SR_Ryza_Plasma_Pistol" == (currentWeapon player)) then {
						if ((missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"],0]) > 0) then {
							_text =
								"[TSR] Ryza Plasma Pistol (Banner/Shield)" 
								+ "<br/>"
								+ "Current heat : " + str(missionNamespace getVariable [format ["%1_heat","SR_Ryza_Plasma_Pistol"],0]);
							10 cutText [
								format["<t align='right'>%1</t>",_text], 
							"PLAIN", 0, false, true];
						};
					};
					sleep 2;
				};
			};
		};
	}
	else {
		if ((missionNamespace getVariable [format ["%1_handler","SR_Ryza_Plasma_Pistol"], -1]) != -1) then {
			player removeEventHandler ["FiredMan", (missionNamespace getVariable [format ["%1_handler","SR_Ryza_Plasma_Pistol"], -1])];
			missionNamespace setVariable [format ["%1_handler","SR_Ryza_Plasma_Pistol"], -1];
		};
	};
	
	/**
	Pseudo version of the system,
	Doesn't work because _x cannot be injected in the event handlers
	
	{
		if (_x in (weapons player)) then {
			if ((missionNamespace getVariable [format ["%1_handler",_x], -1]) == -1) then {
				missionNamespace setVariable [format ["%1_handler",_x], player addEventHandler ["FiredMan", {
					// params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
					_weapon = (_this select 1);
					if (_weapon == _x) then {
						_ammo = player ammo _weapon;
						_projectile = (_this select 6);
						_mode = (_this select 3);
						if (_mode == "Overcharge") then {
							
							//Overcharge consummes 10 shots
							if (_ammo > 8) then {
								player setAmmo [_weapon, _ammo - 9];
								
								_position = getPosWorld _projectile;
								_dirAndUp = [vectorDir _projectile, vectorUp _projectile];
								_velocity = velocity _projectile;
								
								deleteVehicle _projectile;
								
								_projectile = "SR_Overcharge_PlasmagunRound" createVehicle [0,0,0];
								_projectile setPosWorld _position;
								_projectile setVectorDirAndUp _dirAndUp;
								_projectile setVelocityModelSpace [0, 1140, 0];
								
								missionNamespace setVariable [format ["%1_heat",_x], 
									(missionNamespace getVariable [format ["%1_heat",_x],0]) 
									+ ([30, 50] call BIS_fnc_randomInt)];
								
							}
							else { // Not enough ammo for overcharge, fire normally
								// Regular shot, increase heat
								missionNamespace setVariable [format ["%1_heat",_x], 
									(missionNamespace getVariable [format ["%1_heat",_x],0]) 
									+ ([2, 5] call BIS_fnc_randomInt)];
							};
						}
						else {
							// Regular shot, increase heat
							missionNamespace setVariable [format ["%1_heat",_x], 
								(missionNamespace getVariable [format ["%1_heat",_x],0]) 
								+ ([2, 5] call BIS_fnc_randomInt)];
						};
						
						// Check for overheat
						if ((missionNamespace getVariable [format ["%1_heat",_x],0]) > 100) then {
							[] spawn {
								overheat = player addAction ["Weapon lock on", 
									{hintSilent "Weapon overheating";}, [], 0, false, false, "DefaultAction", 
									"'_x' == (currentMuzzle player)"];
								while {(missionNamespace getVariable [format ["%1_heat","_x"],0]) > 0} do {
									sleep 1;
								};
								player removeAction overheat;
							};
						};
					};
					
				}]];
				
				// Spawn cooler
				[_x] spawn {
					_x = (_this select 0);
					while {(missionNamespace getVariable [format ["%1_handler",_x], -1]) != -1} do {
						// Reduce heat if possible
						if (((missionNamespace getVariable [format ["%1_heat",_x],0]) - 2 * getNumber (configFile >> "CfgWeapons" >> _x >> "plasmaCoolingMult")) > 0) then {
							missionNamespace setVariable [format ["%1_heat",_x], 
								(missionNamespace getVariable [format ["%1_heat",_x],0]) 
								- 2 * getNumber (configFile >> "CfgWeapons" >> _x >> "plasmaCoolingMult")];
						}
						else {
							(missionNamespace setVariable [format ["%1_heat",_x],0])
						};
						
						// Display new heat if weapon is the current weapon
						if (_x == (currentWeapon player)) then {
							if ((missionNamespace getVariable [format ["%1_heat",_x],0]) > 0) then {
								_text =
									_x 
									+ "<br/>"
									+ "Current heat : " + str(missionNamespace getVariable [format ["%1_heat",_x],0]);
								10 cutText [
									format["<t align='right'>%1</t>",_text], 
								"PLAIN", 0, false, true];
							};
						};
						sleep 2;
					};
				};
			};
		}
		else {
			if ((missionNamespace getVariable [format ["%1_handler",_x], -1]) != -1) then {
				player removeEventHandler ["FiredMan", (missionNamespace getVariable [format ["%1_handler",_x], -1])];
				missionNamespace setVariable [format ["%1_handler",_x], -1];
			};
		}
	} forEach _plasma_weapons;
	
	{
		if (_x in (weapons player)) then {
			if ((missionNamespace getVariable [format ["%1_handler",_x], -1]) == -1) then {
				missionNamespace setVariable [format ["%1_handler",_x], player addEventHandler ["FiredMan", {
					// params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle"];
					_weapon = (_this select 1);
					
					if (_weapon == _x) then {
						_ammo = player ammo _weapon;
						_projectile = (_this select 6);
						_mode = (_this select 3);
						if (_mode == "Overcharge") then {
							
							//Overcharge consummes 7 shots
							if (_ammo > 5) then {
								player setAmmo [_weapon, _ammo - 6];
								
								_position = getPosWorld _projectile;
								_dirAndUp = [vectorDir _projectile, vectorUp _projectile];
								_velocity = velocity _projectile;
								
								deleteVehicle _projectile;
								
								_projectile = "SR_Overcharge_PlasmapistolRound" createVehicle [0,0,0];
								_projectile setPosWorld _position;
								_projectile setVectorDirAndUp _dirAndUp;
								_projectile setVelocityModelSpace [0, 1140, 0];
								
								missionNamespace setVariable [format ["%1_heat",_x], 
									(missionNamespace getVariable [format ["%1_heat",_x],0]) 
									+ ([40, 60] call BIS_fnc_randomInt)];
								
							}
							else { // Not enough ammo for overcharge, fire normally
								// Regular shot, increase heat
								missionNamespace setVariable [format ["%1_heat",_x], 
									(missionNamespace getVariable [format ["%1_heat",_x],0]) 
									+ ([4, 8] call BIS_fnc_randomInt)];
							};
						}
						else {
							// Regular shot, increase heat
							missionNamespace setVariable [format ["%1_heat",_x], 
								(missionNamespace getVariable [format ["%1_heat",_x],0]) 
								+ ([4, 8] call BIS_fnc_randomInt)];
						};
						
						// Check for overheat
						if ((missionNamespace getVariable [format ["%1_heat",_x],0]) > 100) then {
							[] spawn {
								overheat = player addAction ["Weapon lock on", 
									{hintSilent "Weapon overheating";}, [], 0, false, false, "DefaultAction", 
									"'_x' == (currentMuzzle player)"];
								while {(missionNamespace getVariable [format ["%1_heat","_x"],0]) > 0} do {
									sleep 1;
								};
								player removeAction overheat;
							};
						};
					};
					
				}]];
				
				// Spawn cooler
				[_x] spawn {
					_x = (_this select 0);
					while {(missionNamespace getVariable [format ["%1_handler",_x], -1]) != -1} do {
						// Reduce heat if possible
						if (((missionNamespace getVariable [format ["%1_heat",_x],0]) - 2 * getNumber (configFile >> "CfgWeapons" >> _x >> "plasmaCoolingMult")) > 0) then {
							missionNamespace setVariable [format ["%1_heat",_x], 
								(missionNamespace getVariable [format ["%1_heat",_x],0]) 
								- 2 * getNumber (configFile >> "CfgWeapons" >> _x >> "plasmaCoolingMult")];
						}
						else {
							(missionNamespace setVariable [format ["%1_heat",_x],0])
						};
						
						// Display new heat if weapon is the current weapon
						if (_x == (currentWeapon player)) then {
							if ((missionNamespace getVariable [format ["%1_heat",_x],0]) > 0) then {
								_text =
									_x 
									+ "<br/>"
									+ "Current heat : " + str(missionNamespace getVariable [format ["%1_heat",_x],0]);
								10 cutText [
									format["<t align='right'>%1</t>",_text], 
								"PLAIN", 0, false, true];
							};
						};
						sleep 2;
					};
				};
			};
		}
		else {
			if ((missionNamespace getVariable [format ["%1_handler",_x], -1]) != -1) then {
				player removeEventHandler ["FiredMan", (missionNamespace getVariable [format ["%1_handler",_x], -1])];
				missionNamespace setVariable [format ["%1_handler",_x], -1];
			};
		}
	} forEach _plasma_pistol_weapons;
	
	*/
};