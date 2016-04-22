/**
 * ExileClient_object_lock_toggle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 * DP UP TO DATE FILE 3.6.2016
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_condition","_object","_known","_pincode","_player","_playerUID"];
_condition = _this;
_player = name player;
_playerUID = getPlayerUID player;
_object = ExileClientInteractionObject;
_objPos = getPos _object;
if(ExileLockIsShown)exitWith{};
ExileLockIsShown = true;
_known = _object getVariable ["ExileAlreadyKnownCode",""];
if(_known isEqualTo "")then
{
	_pincode = 4 call ExileClient_gui_keypadDialog_show;
}
else
{
	_pincode = _known;
};
if!(_pincode isEqualTo "")then
{
	["lockToggle",[netId _object,_pincode,_condition,_player,_playerUID,_objPos select 0,_objPos select 1,_objPos select 2]] call ExileClient_system_network_send;
};
call ExileClient_gui_interactionMenu_unhook;
ExileLockIsShown = false;
true