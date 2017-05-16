Original script by Friendly
Edit for Esseker by BoleParty[TGM]

There`s another option out there which is working with ProtectionZones and you could use that one instead. Do what you feel like:)


Stock Epoch AntiHack maybe does a cleanup on the player eventhandlers but i was using InfiStar so i can`t tell for sure.

In case you are using InfiStar in run.sqf change following settings to false:

/*  revert allowDamage   */ _RAD = false; /* true or false */ /* if you have safezones using "player allowDamage false;" or similar.. set _RAD = false; */

/*  HandleDamage check   */ _HDC = false; /* true or false */ /* *experimental + Epoch only* - probably publicVariableServer spam but no more godmode hackers. */

/*  Revert HandleDamage  */ _RHD = false; /* true or false */ /* Needs to be  false  for Paintball script */
/
*  Use EH_Fired check   */ _EHF = false; /* true or false */ /* Some mods revert the EventHandlers by default and can cause problems with this check. Tested on Epoch and AltisLife.  */

In your scripts.txt to allowDamage line add: !"player allowDamage false;" !"player allowDamage true;" and to removeEventHandler line add: !"player removeEventhandler["HandleDamage", _safeZoneDamageEH];"

The safezone.sqf put anywhere into your mission file.

Edit your init.sqf and add: [] execVM "safezone.sqf";

If you don`t have an init.sqf just create one and add this line to it.

You can put this file into any folder being loctated in your mission.pbo but you have to call it from the right spot then (for example: [] execVM "scripts\safezone.sqf";

Replace your mission.sqm with the attached one or add the code yourself. If you wanna do all on your own then propbably your mission.sqm is still encrypted so you need to decrypt it. I use eliteness for this action and you can download it from here:

http://www.ofpec.com/editors-depot/index.php?action=details&id=383


Your markers class needs to be replaced with following code:

class Markers
	{
		items=9;
		class Item0
		{
			position[]={6140.4678,85.32708,5941.604};
			name="center";
			type="Empty";
		};
		class Item1
		{
			position[]={263.93359,123.68,1416.0308};
			name="respawn_west";
			type="Empty";
		};
		class Item2
		{
			position[]={263.93359,123.68,1416.0308};
			name="respawn_east";
			type="Empty";
		};
		class Item3
		{
			position[]={4406.9297,185.35191,6055.1948};
			name="westsafezone";
			text="Safe Zone";
			type="mil_warning";
			colorName="ColorRed";
		};
		class Item4
		{
			position[]={5073.1494,164.17688,8902.2256};
			name="northspawn";
			markerType="ELLIPSE";
			type="Empty";
			colorName="ColorGreen";
			fillName="Grid";
			a=250;
			b=250;
		};
		class Item5
		{
			position[]={5073.9189,164.18689,8903.459};
			name="northsafezone";
			text="Safe Zone";
			type="mil_warning";
			colorName="ColorRed";
		};
		class Item6
		{
			position[]={8692.2891,182.51883,3856.0627};
			name="eastspawn";
			markerType="ELLIPSE";
			type="Empty";
			colorName="ColorGreen";
			fillName="Grid";
			a=250;
			b=250;
		};
		class Item7
		{
			position[]={8691.8105,182.49808,3854.4675};
			name="eastsafezone";
			text="Safe Zone";
			type="mil_warning";
			colorName="ColorRed";
		};
		class Item8
		{
			position[]={4404.998,185.45877,6055.0225};
			name="westspawn";
			markerType="ELLIPSE";
			type="Empty";
			colorName="ColorGreen";
			fillName="Grid";
			a=250;
			b=250;
		};
	};
	
	Directly after class markers add:

	class Sensors
	{
		items=3;
		class Item0
		{
			position[]={8691.124,182.55141,3854.9487};
			a=250;
			b=250;
			activationBy="ANY";
			repeating=1;
			interruptable=1;
			age="UNKNOWN";
			name="eastsafezone";
			expCond="(player distance eastsafezone) < 250;";
			expActiv="hint ""You entered a safe zone - Acts of war are strictly forbidden!"";  inSafeZone = true;";
			expDesactiv="hint ""You are leaving the safe zone!""; inSafeZone = false;";
			class Effects
			{
			};
		};
		class Item1
		{
			position[]={4405.3877,185.42311,6054.1172};
			a=250;
			b=250;
			activationBy="ANY";
			repeating=1;
			interruptable=1;
			age="UNKNOWN";
			name="westsafezone";
			expCond="(player distance westsafezone) < 250;";
			expActiv="hint ""You entered a safe zone - Acts of war are strictly forbidden!""; inSafeZone = true;";
			expDesactiv="hint ""You are leaving the safe zone!""; inSafeZone = false;";
			class Effects
			{
			};
		};
		class Item2
		{
			position[]={5072.6343,164.17076,8901.5186};
			a=250;
			b=250;
			activationBy="ANY";
			repeating=1;
			interruptable=1;
			age="UNKNOWN";
			name="northsafezone";
			expCond="(player distance northsafezone) < 250;";
			expActiv="hint ""You entered a safe zone - Acts of war are strictly forbidden!""; inSafeZone = true;";
			expDesactiv="hint ""You are leaving the safe zone!""; inSafeZone = false;";
			class Effects
			{
			};
		};
	};
	

After your changes you don`t need to encrypt the file again as the server will read the decrypted mission.sqm without any issues.

License:

Arma Public License Share Alike (APL-SA): https://www.bistudio.com/community/licenses/arma-public-license-share-alike
