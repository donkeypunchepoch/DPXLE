/**
 * ExileServer_object_construction_database_delete
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 * DP UP TO DATE FILE 3.6.2016
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_constructionObject","_constructionID"];
_constructionObject = _this;
_constructionID = _constructionObject getVariable ["ExileDatabaseID", -1];
if (_constructionID > -1) then
{
	_data = format ["loadConstruction:%1", _constructionID] call ExileServer_system_database_query_selectSingle;
	_class = _data select 1;
	_ownerUID = _data select 2;
	_spawnedIn = _data select 3;
	_posX = _data select 4;
	_posY = _data select 5;
	_posZ = _data select 6;
	_wasLocked = _data select 13;
	_pinCode = _data select 14;
	format["insertConstructionHistory:%1:%2:%3:%4:%5:%6:%7:%8", _constructionID, _ownerUID, _class, _posX, _posY, _posZ, _wasLocked, _pinCode] call ExileServer_system_database_query_fireAndForget;
	format ["deleteConstruction:%1", _constructionID] call ExileServer_system_database_query_fireAndForget;
};
true