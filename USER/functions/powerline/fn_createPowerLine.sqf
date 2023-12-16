params ["_object1", "_object2"];

private _powerLine = ropeCreate [_object1, [0,0,0], 60, ["", [0,0,-1]], ["", [0,0,-1]], "TFAR_RopeSmallWire"];

private _attachHelper = "ace_fastroping_helper" createVehicle [0,0,0];
_attachHelper allowDamage false;
_attachHelper attachTo [_object2, [0, 0, 0], "lefthand", true];
[_attachHelper, [0, 0, 0], [0,0,-1]] ropeAttachTo _powerLine;
