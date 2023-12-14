private _spawnposition = [3284.49,6859.4,0];

private _nearestObject = nearestObject _spawnposition;
if (!isNull (_nearestObject)) then {
	if (_nearestObject distance _spawnposition < 3) then {

	private _ural = "gm_gc_civ_ural375d_cargo" createVehicle [0,0,0];
	_ural setVehicleLock "unlocked";
	_ural setDir 160;
	_ural setPos _spawnposition;

	private _minePositions = [
		[0.25415,2.76086,-1.17686],
		[0.64209,-1.49768,-1.36008],
		[0.0471191,3.84473,-1.16257],
		[-0.427246,2.71655,-1.28675],
		[-0.544189,-1.52783,-1.32019],
		[-0.00195313,-3.17419,-1.19368]
	];

	private _mine = "gm_minestatic_ap_pfm1" createVehicle [0,0,0];
	_mine attachTo [_ural, selectRandom _minePositions];
	_mine allowDamage false;

	private _driver = (creategroup civilian) createUnit ["UK3CB_TKC_C_WORKER", [0,0,0], [], 0, "NONE"];
	_driver assignAsDriver _ural;
	_driver moveInDriver _ural;
	_driver setVariable ["lambs_danger_disableAI", true];

	} else {
		systemchat "too close to existing object";
	};
};
