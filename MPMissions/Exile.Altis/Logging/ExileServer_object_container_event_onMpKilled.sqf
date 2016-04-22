/**
 * ExileServer_object_container_event_onMpKilled
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 * DP UP TO DATE FILE 3.6.2016
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_object"];
_object = _this;
_destroyer = _this select 1;
_objClass = typeOf _object;
_objID = _object getVariable ["ExileDatabaseID", -1];
_data = format ["loadContainer:%1", _objID] call ExileServer_system_database_query_selectSingle;
_class = _data select 1;
_objOwner = _data select 2;
_objItems = _data select 13;
_objMags = _data select 14;
_objWpns = _data select 15;
_pName = name _destroyer;
_pUID = getPlayerUID _destroyer;
_objPos = getPos _object;
format["insertContainerHistory:%1:%2:%3:%4:%5:%6:%7:%8", _objID, _objOwner, _objClass, _objPos select 0, _objPos select 1, _objPos select 2, _pName, _pUID] call ExileServer_system_database_query_fireAndForget;
_object call ExileServer_object_container_database_delete;

deleteVehicle _object;