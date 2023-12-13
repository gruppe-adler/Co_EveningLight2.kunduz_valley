

if (hasInterface) then {

	if (player getVariable ["grad_defuseStickHandling", false]) exitWith {};
	player setVariable ["grad_defuseStickHandling", true];


	grad_defuseStickHandling_attach = {
		private _stick = (player getVariable ["grad_defuseStickAttached", objNull];
		if (isNull _stick) then {
			_stick = createSimpleObject ["", position player, false];
		};
		_stick attachTo [player, [0,0,0], "spine", true];
		_stick setVectorDirAndUp [[0,0,0], [0,0,0]];
	};

	grad_defuseStickHandling_detach = {
		private _stick = (player getVariable ["grad_defuseStickAttached", objNull];
		if (!isNull _stick) then {
			deleteVehicle _stick;
		};
	};


	["loadout", {
		// do nothing if player still has classname
		if (player hasWeapon "classname") exitWith {};

		// remove stick if its there, e.g. player dropped secondary
		private _stick = (player getVariable ["grad_defuseStickAttached", objNull];
		if (!isNull _stick) then {
			call grad_defuseStickHandling_detach;
		};

	}] call CBA_fnc_addPlayerEventHandler;

	["weapon", {
		// only do work if player owns item
		if (player hasWeapon "classname") then {
			if (currentWeapon player == "classname") then {
				call grad_defuseStickHandling_attach;
			} else {
				call grad_defuseStickHandling_detach;
			};
		};
	}] call CBA_fnc_addPlayerEventHandler;

};