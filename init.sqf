﻿// JIP Check (This code should be placed first line of init.sqf file)
if (!isServer && isNull player) then {isJIP=true;} else {isJIP=false;};
enableSaving [false, false];

//view distance options
setViewDistance 3000;
setTerrainGrid 6.25;

//UpsMon-Init:
//for the server upsmon is called via preInit!

//parameters:
call ADV_fnc_parVariables;
call ADV_fnc_variables;

hunting = compile preprocessFile "scripts\hunting.sqf";

 [
    position camera,
    "Eye of the Tiger",
    300,
    200,
    0,
    1,
    []
  ] spawn BIS_fnc_establishingShot;

waitUntil {!isNil "ADV_params_defined"};
//custom init (mission specific):
[] spawn compile preprocessFileLineNumbers "mission\init_custom.sqf";

if ( isServer ) then {
	//time and date:
	setDate [2016, 8, ADV_par_day, ADV_par_hour, ADV_par_minute];

	//randomweather:
	if (ADV_par_weather != 99) then {
		ADV_handle_randomWeather = [] spawn MtB_fnc_randomWeather;
	};

	//stops the blabbering of AI units and players
	if ( isMultiplayer ) then {
		{_x setVariable ["BIS_noCoreConversations", true, true]} forEach allUnits;
	};

	//ADV_handle_zbeCache = [1200,-1,false,100,1200,1200] spawn compile preprocessFileLineNumbers "scripts\zbe_cache\main.sqf";

	sleep 1;

	//custom vehicles:
	//[] spawn ADV_fnc_manageVeh;
	//[] spawn ADV_opf_fnc_manageVeh;
	//[] spawn ADV_ind_fnc_manageVeh;

	/*
	//dead body and vehicle removery
	if (ADV_par_headlessClient != 1) then {
		ADV_handle_cleanUp = [
			10*60,	// seconds to delete dead bodies (0 means don't delete)
			15*60,	// seconds to delete dead vehicles (0 means don't delete)
			0*60,	// seconds to delete immobile vehicles (0 means don't delete)
			10*60,	// seconds to delete dropped weapons (0 means don't delete)
			0*60,	// seconds to deleted planted explosives (0 means don't delete)
			6*60	// seconds to delete dropped smokes/chemlights (0 means don't delete)
		] spawn aeroson_fnc_cleanUp;
	};*/

	//removes notification and bird of all curators:
	{ _x setVariable ["birdType",""]; _x setVariable ["showNotification",false]; [_x, [-1, -2, 2]] call bis_fnc_setCuratorVisionModes;} forEach allCurators;

	//sets ownership of the units to either zeus or the HC:
	[] spawn {
		waitUntil {time > 1};
		if (ADV_par_headlessClient == 1) then {
			ADV_handle_zeusObjects = [true] spawn ADV_fnc_zeusObjects;
		};
	};

	//crates and gear related
	[] spawn {
		//west crates:
		ADV_objects_clearCargo = [];
		if (!isNil "crate_1") then {[crate_1] call ADV_fnc_clearCargo;};
		if (!isNil "crate_2") then {ADV_objects_clearCargo pushBack crate_2};
		if (!isNil "crate_3") then {ADV_objects_clearCargo pushBack crate_3};
		if (!isNil "crate_4") then {ADV_objects_clearCargo pushBack crate_4};
		if (!isNil "crate_5") then {ADV_objects_clearCargo pushBack crate_5};
		if (!isNil "crate_6") then {ADV_objects_clearCargo pushBack crate_6};
		if (!isNil "crate_7") then {ADV_objects_clearCargo pushBack crate_7};
		if !(count ADV_objects_clearCargo == 0) then {
			ADV_objects_clearCargo call ADV_fnc_clearCargo;
			sleep 1;
			ADV_objects_clearCargo call ADV_fnc_crate;
		};
		//indep crates
		if (!isNil "ind_crate_1") then {[ind_crate_1] call ADV_fnc_clearCargo;};
		if (!isNil "ind_crate_2") then {[ind_crate_2] call ADV_fnc_clearCargo;[ind_crate_2] call ADV_ind_fnc_crate;};
		if (!isNil "ind_crate_empty") then {[ind_crate_empty] call ADV_fnc_clearCargo;[ind_crate_empty] call ADV_ind_fnc_crate;};
		//east crates:
		ADV_objects_opfClearCargo = [];
		if (!isNil "opf_crate_1") then {[opf_crate_1] call ADV_fnc_clearCargo;};
		if (!isNil "opf_crate_2") then {ADV_objects_opfClearCargo pushBack opf_crate_2};
		if (!isNil "opf_crate_3") then {ADV_objects_opfClearCargo pushBack opf_crate_3};
		if (!isNil "opf_crate_4") then {ADV_objects_opfClearCargo pushBack opf_crate_4};
		if (!isNil "opf_crate_5") then {ADV_objects_opfClearCargo pushBack opf_crate_5};
		if (!isNil "opf_crate_6") then {ADV_objects_opfClearCargo pushBack opf_crate_6};
		if (!isNil "opf_crate_7") then {ADV_objects_opfClearCargo pushBack opf_crate_7};
		if !(count ADV_objects_opfClearCargo == 0) then {
			ADV_objects_opfClearCargo call ADV_fnc_clearCargo;
			sleep 1;
			ADV_objects_opfClearCargo call ADV_opf_fnc_crate;
		};

		//additional crates:
		if (!isNil "mgCrate") then {[mgCrate] call ADV_fnc_clearCargo;};
		if (!isNil "opf_mgCrate") then {[opf_mgCrate] call ADV_fnc_clearCargo;};
		if (!isNil "ind_mgCrate") then {[ind_mgCrate] call ADV_fnc_clearCargo;};

		if (!isNil "crate_empty") then {[crate_empty] call ADV_fnc_clearCargo;};
		if (!isNil "opf_crate_empty") then {[opf_crate_empty] call ADV_fnc_clearCargo;};
	};


};



//mission dramaturgy (will be executed on server as long as HC param is not selected. If HC param is selected it will be executed on HC only)
if (ADV_par_headlessClient == 2) then {
	//Werthles Headless Client, script version:
	//ADV_handle_werthles = [true, 30, false, false, 30, 3, false, []] spawn compile preprocessFileLineNumbers "scripts\WerthlesHeadless.sqf";
	if !(isServer || hasInterface) then {
		ADV_handle_dramaturgy = [] execVM "mission\ADV_dramaturgy.sqf";
	};
} else {
	if (isServer) then {
		ADV_handle_dramaturgy = [] execVM "mission\ADV_dramaturgy.sqf";
	};
};

//engine artillery
if (ADV_par_engineArtillery == 1) then {
	enableEngineArtillery false;
};

//ACE stuff that's been forgotten by the developers:
if (isClass(configFile >> "CfgPatches" >> "ace_explosives")) then {
	{
		_defuseHelper = "ACE_DefuseObject" createVehicleLocal (getPos _x);
		_defuseHelper attachTo [_x, [0,0,0]];
		_defuseHelper setVariable ["ACE_explosives_Explosive",_x];
	} forEach allMines;
};

/*
ADV_handle_aiFatigue = [] spawn {
	while {true} do {
		{ if ( !isPlayer _x && !(_x getVariable ["ADV_var_aiFatigue",false]) ) then { _x enableFatigue false; _x enableStamina false; _x setVariable ["ADV_var_aiFatigue",false]; }; } forEach allUnits;
		sleep 10;
	};
};
*/

if (true) exitWith {};