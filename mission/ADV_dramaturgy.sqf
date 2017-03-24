if (!isServer && hasInterface) exitWith {};

if !(isServer || hasInterface) then {ADV_HCpresent = 1;};
if (isServer) then {ADV_HCpresent = 0;};
publicVariable "ADV_HCpresent";

if (isNil "ADV_taskVar") then { ADV_taskVar = 0; };
if (isNil "ADV_spawnVar") then { ADV_spawnVar = 0; };

//upsmon arrays for editor placed units (for HC-compatibility)
/*
[] spawn {
	_upsmonCalls = [
		//[opf_group_1,"area","CARELESS","LIMITED"]
	];
	if (count _upsmonCalls != 0) then {
		{_x execVM "scripts\upsmon.sqf"} forEach _upsmonCalls;
	};
};
*/

//scripts for first mission part
waitUntil {sleep 1; ADV_taskVar == 1};

 [["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2"],independent,50,["LIMITED","CARELESS","STAG COLUMN"],[sp1,sp2,sp3,sp4,sp5]] call ADV_fnc_spawnPatrol;
_marker1 = createMarker ["party", ma1];
"party" setMarkerType "hd_objective";
"party" setMarkerColor "colorBLUFOR";
"party" setMarkerText "Verbündets Dorf";
[["task_1", "canceled"],"FHQ_TT_setTaskState",false] call BIS_fnc_MP;
sleep 5;
[[{true},["task_2","Überleben ist unsere Priorität aber am besten holen wir Hilfe per Funk beim verbündeten Dorf.","Überleben","Überleben",(getMarkerPos "marker"),"assigned"]],"FHQ_TT_addTasks",false] call BIS_fnc_MP;

sleep 15;

[spawn1,independent,["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman"],"FULL"] call hunting;


sleep 8;


[spawn2,independent,["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman"],"FULL"] call hunting;




waitUntil {sleep 1; ADV_taskVar == 2};

[["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman"],independent,50,["LIMITED","SAFE","STAG COLUMN"],[sp6,sp7,sp8,sp9]] call ADV_fnc_spawnPatrol;

sleep 3;

[spawn3,independent,["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_GL"],"FULL"] call hunting;

sleep 8;

[spawn4,independent,["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_Rifleman_3"],"FULL"] call hunting;

sleep 4;

[spawn5,independent,["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman"],"FULL"] call hunting;

sleep 1;

[spawn6,independent,["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_AR_Asst"],"FULL"] call hunting;



waitUntil {sleep 1; ADV_taskVar == 3};


[["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_GL"],independent,50,["LIMITED","SAFE","STAG COLUMN"],[sp10,sp11,sp12,sp13]] call ADV_fnc_spawnPatrol;

sleep 5;

[spawn7,independent,["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman"],"FULL"] call hunting;

sleep 10;

[spawn8,independent,["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman"],"FULL"] call hunting;

sleep 6;

[spawn9,independent,["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman"],"FULL"] call hunting;

sleep 7;

[spawn10,independent,["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman"],"FULL"] call hunting;

waitUntil {sleep 1; ADV_taskVar == 4};

[[moe1,moe2,moe3,moe3,moe4,moe5,moe6,moe7,moe8],"Sh_155mm_AMOS",[3,7],300,5,50] spawn ADV_fnc_artillery;

sleep 5;

[["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_AR_Asst"],independent,50,[end1],ziel1] call ADV_fnc_spawnAttack;
sleep 2;
[["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_AR_Asst"],independent,50,[end3],ziel2] call ADV_fnc_spawnAttack;
sleep 2;
[["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_AR_Asst"],independent,50,[end5],ziel3] call ADV_fnc_spawnAttack;
sleep 2;
[["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_AR_Asst"],independent,50,[end7],ziel4] call ADV_fnc_spawnAttack;
sleep 2;
[["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_AR_Asst"],independent,50,[end9],ziel5] call ADV_fnc_spawnAttack;
sleep 2;
[["LOP_AFR_Infantry_TL","LOP_AFR_Infantry_Rifleman_2","LOP_AFR_Infantry_Rifleman","LOP_AFR_Infantry_AR","LOP_AFR_Infantry_AR_Asst"],independent,50,[end11],ziel6] call ADV_fnc_spawnAttack;
sleep 10;
[["rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_autorifleman_m249_ass","rhsusf_usmc_marpat_wd_rifleman_m590"],west,50,[end2],ziel1] call ADV_fnc_spawnAttack;
sleep 2;
[["rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_autorifleman_m249_ass","rhsusf_usmc_marpat_wd_grenadier_m32"],west,50,[end4],ziel2] call ADV_fnc_spawnAttack;
sleep 2;
[["rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_autorifleman_m249_ass","rhsusf_usmc_marpat_wd_rifleman_m590"],west,50,[end6],ziel3] call ADV_fnc_spawnAttack;
sleep 2;
[["rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_autorifleman_m249_ass","rhsusf_usmc_marpat_wd_grenadier_m32"],west,50,[end8],ziel4] call ADV_fnc_spawnAttack;
sleep 2;
[["rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_autorifleman_m249_ass","rhsusf_usmc_marpat_wd_grenadier_m32"],west,50,[end10],ziel5] call ADV_fnc_spawnAttack;
sleep 2;
[["rhsusf_usmc_marpat_wd_squadleader","rhsusf_usmc_marpat_wd_grenadier","rhsusf_usmc_marpat_wd_rifleman","rhsusf_usmc_marpat_wd_autorifleman_m249","rhsusf_usmc_marpat_wd_autorifleman_m249_ass","rhsusf_usmc_marpat_wd_rifleman_m590"],west,50,[end12],ziel6] call ADV_fnc_spawnAttack;

waitUntil {sleep 1; ADV_taskVar == 5};

[["task_3", "succeeded"],"FHQ_TT_setTaskState",false] call BIS_fnc_MP;

sleep 10;

["outro.sqf"] remoteExec ["bis_fnc_execVM",0];

sleep 228;

[["End2",true,8], "BIS_fnc_endMission", true] call BIS_fnc_MP;

//scripts for following mission parts
ADV_handle_dramaturgy_1 = [] spawn {

};

//mission end:
ADV_handle_dramaturgy_end = [] spawn {
	waitUntil {sleep 1; ADV_taskVar == 99};
	["task_1", "succeeded"] remoteExec ["FHQ_TT_setTaskState",2];
	sleep 20;
	["End1",true,8] remoteExec ["BIS_fnc_endMission",0];
};

/*
//possible spawn calls:
[["O_Soldier_TL_F","O_Soldier_GL_F","O_Soldier_F","O_soldier_AR_F","O_medic_F"],east,50,["LIMITED","CARELESS","STAG COLUMN"],[spawnLogic_1]] call ADV_fnc_spawnPatrol;
//or:
[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_F","I_soldier_GL_F","I_medic_F"],independent,50,["LIMITED","CARELESS","STAG COLUMN"],[spawnLogic_1,spawnLogic_2],"area_1"] call ADV_fnc_spawnPatrol;
or:
[["I_Soldier_TL_F","I_Soldier_AR_F","I_Soldier_F","I_soldier_GL_F","I_medic_F"],independent,50,[spawnLogic_1],attackLogic_1] call ADV_fnc_spawnAttack;
//for calling custom loadouts on last group spawned (just add one spawnLogic/Marker):
_grp = [["B_Sniper_F","B_Spotter_F"],west,200,["LIMITED","STAG COLUMN","NOFOLLOW"],[spawnLogic_1]] call ADV_fnc_spawnPatrol;
[(units _grp) select 0] call ADV_fnc_sniper;
[(units _grp) select 1] call ADV_fnc_spotter;
//for adding new tasks, create a new case in ADV_tasks.sqf, a new task within this case and call like this:
[2] remoteExec ["ADV_fnc_tasks",2];
*/

if (true) exitWith {};

