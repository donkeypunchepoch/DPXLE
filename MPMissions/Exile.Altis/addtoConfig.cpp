//add near top of config.cpp
#include "Logging\CfgNetworkMessages.hpp" 


class CfgExileCustomCode 
{
	//Extra Logging files Player + Vehicle + Container history log
	ExileServer_object_player_event_onMpKilled = "Logging\ExileServer_object_player_event_onMpKilled.sqf";
	
	ExileServer_object_vehicle_event_onMPKilled = "Logging\ExileServer_object_vehicle_event_onMPKilled.sqf";
	
	ExileServer_object_container_event_onMPKilled = "Logging\ExileServer_object_container_event_onMPKilled.sqf";
	
	ExileServer_object_lock_network_lockToggle = "Logging\ExileServer_object_lock_network_lockToggle.sqf";
	
	ExileClient_object_lock_toggle = "Logging\ExileClient_object_lock_toggle.sqf";
	
	ExileServer_system_trading_network_sellItemRequest = "Logging\ExileServer_system_trading_network_sellItemRequest.sqf";
	
	ExileServer_system_trading_network_wasteDumpRequest =
	"Logging\ExileServer_system_trading_network_wasteDumpRequest.sqf";
	
	ExileServer_system_trading_network_purchaseVehicleRequest = "Logging\ExileServer_system_trading_network_purchaseVehicleRequest.sqf";
	
	ExileServer_system_trading_network_purchaseVehicleSkinRequest =
	"Logging\ExileServer_system_trading_network_purchaseVehicleSkinRequest.sqf";
	
	ExileServer_system_trading_network_purchaseItemRequest = "Logging\ExileServer_system_trading_network_purchaseItemRequest.sqf";
	
	ExileServer_object_construction_database_delete = "Logging\ExileServer_object_construction_database_delete.sqf";
	
	ExileServer_system_trading_network_sendMoneyRequest = "Logging\ExileServer_system_trading_network_sendMoneyRequest.sqf";
	
	ExileServer_system_network_dispatchIncomingMessage = "Logging\ExileServer_system_network_dispatchIncomingMessage.sqf";
};	