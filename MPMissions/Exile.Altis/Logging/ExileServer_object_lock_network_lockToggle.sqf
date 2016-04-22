/**
 * ExileServer_object_lock_network_lockToggle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 * DP UP TO DATE FILE 3.6.2016
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_paramaters","_object","_pincode","_state","_objectPinCode","_type","_accessDenied","_accessDenialExpiresAt","_numberOfFails","_player","_playerUID","_objPosX","_objPosY","_objPosZ","_access"];
_sessionID = _this select 0;
_paramaters = _this select 1;
_object = objectFromNetId (_paramaters select 0);
_pincode = _paramaters select 1;
_state = _paramaters select 2;
_player = _paramaters select 3;
_playerUID = _paramaters select 4;
_objPosX = _paramaters select 5;
_objPosY = _paramaters select 6;
_objPosZ = _paramaters select 7;
_type = typeOf _object;
_objectOwnerUID = "";
_objectPinCode = _object getVariable ["ExileAccessCode","000000"];

_accessDenied = false;
if (_object getVariable ["ExileAccessDenied", false]) then 
{
	_accessDenialExpiresAt = _object getVariable ["ExileAccessDeniedExpiresAt", 0];
	if (time > _accessDenialExpiresAt) then 
	{
		_object setVariable ["ExileAccessDenied", false];
		_object setVariable ["ExileAccessDeniedExpiresAt", 0];	
	}
	else 
	{
		_accessDenied = true;
	};
};
if (_accessDenied) then 
{
	[_sessionID,"lockResponse",["Access denied!", false, "", "", -1]] call ExileServer_system_network_send_to;
	_access = "Denied";
	format["insertLockToggleAttempt:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10",_player, _playerUID,_pincode,_objPosX, _objPosY, _objPosZ,_type,_sessionID,_objectPinCode,_access] call ExileServer_system_database_query_fireAndForget;
}
else 
{
	if((count _pincode) isEqualTo (count _objectPinCode))then
	{
		if(_pincode isEqualTo _objectPinCode)then
		{
			if!(_state)then
			{
				if(isNumber(configFile >> "CfgVehicles" >> _type >> "exileIsLockable"))then
				{
					_object setVariable ["ExileIsLocked",0,true];
				}
				else
				{
					if(local _object)then
					{
						_object lock 0;
					}
					else
					{
						[owner _object,"LockVehicleRequest",[netId _object,false]] call ExileServer_system_network_send_to;
					};
					_object setVariable ["ExileIsLocked",0];
				};
				[_sessionID,"lockResponse",["Unlocked!", true , netId _object , _objectPinCode, 0]] call ExileServer_system_network_send_to;
				_object enableRopeAttach true;
				_access = "UNLOCKED";
				format["insertLockToggleAttempt:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10",_player, _playerUID,_pincode,_objPosX, _objPosY, _objPosZ,_type,_sessionID,_objectPinCode,_access] call ExileServer_system_database_query_fireAndForget;
			}
			else
			{
				if(isNumber(configFile >> "CfgVehicles" >> _type >> "exileIsLockable"))then
				{
					_object setVariable ["ExileIsLocked",-1,true];
				}
				else
				{
					if(local _object)then
					{
						_object lock 2;
					}
					else
					{
						[owner _object,"LockVehicleRequest",[netId _object,true]] call ExileServer_system_network_send_to;
					};
					_object setVariable ["ExileIsLocked",-1];
				};
				[_sessionID,"lockResponse",["Locked!",true, netId _object, _objectPinCode, 2]] call ExileServer_system_network_send_to;
				_object enableRopeAttach false;
				_access = "LOCKED";
				format["insertLockToggleAttempt:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10",_player, _playerUID,_pincode,_objPosX, _objPosY, _objPosZ,_type,_sessionID,_objectPinCode,_access] call ExileServer_system_database_query_fireAndForget;
			};
			_object setVariable ["ExileLastLockToggleAt", time];
			_object setVariable ["ExileAccessDenied", false];
			_object setVariable ["ExileAccessDeniedExpiresAt", 0];		
			_object call ExileServer_system_vehicleSaveQueue_addVehicle;
		}
		else
		{
			if (_object call ExileClient_util_world_isInTraderZone) then 
			{
				[_sessionID,"lockResponse",["Wrong PIN!", false, "", "", -1]] call ExileServer_system_network_send_to;
				_access = "BAD PIN";
				format["insertLockToggleAttempt:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10",_player, _playerUID,_pincode,_objPosX, _objPosY, _objPosZ,_type,_sessionID,_objectPinCode,_access] call ExileServer_system_database_query_fireAndForget;
			}
			else 
			{
				_numberOfFails = _object getVariable ["ExileNumberOfFailedLocks", 0];
				_numberOfFails = _numberOfFails + 1;
				_object setVariable ["ExileNumberOfFailedLocks", _numberOfFails];
				switch (_numberOfFails) do 
				{
					case 1:
					{
						[_sessionID,"lockResponse",["Wrong PIN! Two tries remaining.", false, "", "", -1]] call ExileServer_system_network_send_to;
						_access = "BAD PIN x1";
						format["insertLockToggleAttempt:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10",_player, _playerUID,_pincode,_objPosX, _objPosY, _objPosZ,_type,_sessionID,_objectPinCode,_access] call ExileServer_system_database_query_fireAndForget;
						
					};
					case 2:
					{
						[_sessionID,"lockResponse",["Wrong PIN! One try remaining.", false, "", "", -1]] call ExileServer_system_network_send_to;
						_access = "BAD PIN x2";
						format["insertLockToggleAttempt:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10",_player, _playerUID,_pincode,_objPosX, _objPosY, _objPosZ,_type,_sessionID,_objectPinCode,_access] call ExileServer_system_database_query_fireAndForget;
					};
					default
					{
						[_sessionID,"lockResponse",["Wrong PIN! Access denied for five minutes.", false, "", "", -1]] call ExileServer_system_network_send_to;
						_access = "BAD PIN LOCKOUT";
						format["insertLockToggleAttempt:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10",_player, _playerUID,_pincode,_objPosX, _objPosY, _objPosZ,_type,_sessionID,_objectPinCode,_access] call ExileServer_system_database_query_fireAndForget;
						_object setVariable ["ExileAccessDenied", true];
						_object setVariable ["ExileAccessDeniedExpiresAt", time + (5 * 60)];
					};						
				};
			};
		};
	};
};
true