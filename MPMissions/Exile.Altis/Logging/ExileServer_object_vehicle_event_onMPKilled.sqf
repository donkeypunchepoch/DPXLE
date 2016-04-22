/**
 * ExileServer_object_vehicle_event_onMPKilled
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 * DP UP TO DATE FILE 3.6.2016
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleObject"];
if !(isServer) exitWith {true};
_vehicleObject = _this select 0;
_killer = _this select 1;
_vehicleClass = typeOf _vehicleObject;
_vehicleID = _vehicleObject getVariable ["ExileDatabaseID", -1];
_data = format ["loadVehicle:%1", _vehicleID] call ExileServer_system_database_query_selectSingle;
_class = _data select 1;
_vehOwner = _data select 3;
_kName = name _killer;
_kUID = getPlayerUID _killer;
_vehiclePosition = getPos _vehicleObject;
if (_vehicleObject getVariable ["ExileIsPersistent", false]) then 
{
	format["insertVehicleHistory:%1:%2:%3:%4:%5:%6:%7", _vehicleID, _vehOwner, _vehicleClass, _vehiclePosition select 0, _vehiclePosition select 1, _vehiclePosition select 2, _kUID] call ExileServer_system_database_query_fireAndForget;
};
_vehicleObject call ExileServer_object_vehicle_remove;
_vehicleObject setVariable ["ExileDiedAt", time];
true