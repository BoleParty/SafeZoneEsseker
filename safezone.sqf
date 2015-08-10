/*Orignial script by Friendly
Edit for Esseker by BoleParty[TGM]*/

if (isNil "inSafezone") then {
    inSafezone = false;
};
while {
    true
}
do {
    private["_safeZoneDamageEH", "_safeZoneFiredEH"];
    waitUntil {
        inSafeZone
    };
    player allowDamage false;
_safeZoneDamageEH = player addEventhandler["HandleDamage",{false}];
    _safeZoneFiredEH = player addEventHandler ["Fired", {
   deleteVehicle (_this select 6);
systemChat ("You Are Not Allowed To Use Any Kind Of Weapons Within The Safe Zone");
    }];
    waitUntil {
        !inSafeZone
    };
    player allowDamage true;
    player removeEventhandler["HandleDamage", _safeZoneDamageEH];
    player removeEventHandler["Fired", _safeZoneFiredEH];
