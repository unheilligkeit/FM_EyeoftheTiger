
_gen = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_gen removeAction _id;



["Hier ist USMC Sanitätstruppe Golf 1. Hauptquartier hören sie mich?","hint",true,true] call BIS_fnc_MP;

sleep 10;


["Golf 1 hier Hauptquartier sie leben noch ?","hint",true,true] call BIS_fnc_MP;

sleep 10;

["Hauptquartier hier Golf 1 postiv doch wir werden von Miliztruppen verfolgt brauchen dringend evac.","hint",true,true] call BIS_fnc_MP;

sleep 10;

["Golf 1 Negativ evac ist nicht möglich Luftraum ist zu heiss.","hint",true,true] call BIS_fnc_MP;

sleep 10;

["Sie müssen sich leider selber bis zum UN FOB durchschlagen das ist am nächsten von ihnen.","hint",true,true] call BIS_fnc_MP;

sleep 10;

["Zur ihrer Unterstützung werden wir an der Frontline einen Gegenangriff starten das sollte sie ablenken. Viel Glück Golf 1","hint",true,true] call BIS_fnc_MP;

[["task_2", "succeeded"],"FHQ_TT_setTaskState",false] call BIS_fnc_MP;

sleep 5;

[[{true},["task_3","Der Luftraum ist zu heiss für evac darum müsst ihr selbständig zum UN FOB gelangen.","Flieht zum UN FOB","Flieht zum UN FOB",(getMarkerPos "marker2"),"assigned"]],"FHQ_TT_addTasks",false] call BIS_fnc_MP;
