#define _ARMA_

class CfgPatches
{
	class sr_sfx
	{
		name = "Solar Reavers Sound Effects Mod";
		author = "Tengu";
		requiredAddons[] = {"A3_Sounds_F"};
		units[] = {"sr_module_electronic_alert_sys","sr_module_sfx_blue_alert","sr_module_sfx_red_alert","sr_module_sfx_intruder_alert","sr_module_sfx_evacuation_klaxon","sr_module_sfx_electrical_arcs","sr_module_sfx_trench_whistle","sr_module_sfx_nid_laugh","sr_module_sfx_nid_speech_1","sr_module_sfx_nid_speech_2","sr_module_sfx_nid_roar_1","sr_module_sfx_nid_roar_2","sr_module_sfx_nid_wheeze"};
		weapons[] = {""};
		magazines[] = {""};
		ammo[] = {""};
	};
};
class CfgMusic
{
	class SR_SFXSong0
	{
		name = "ShipArrival";
		sound[] = {"SR_SFX\folderwithtracks\ShipArrival.ogg",1,1};
		duration = 99;
		musicClass = "SR_SFX";
	};
};
class CfgMusicClasses
{
	class SR_SFX
	{
		displayName = "SR_SFX";
	};
};
class CfgSFX
{
	class sr_sfx_electronic_alert_sys
	{
		name = "[TSR] Electronic Alert System";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\Electronic_Alert_system.ogg",5,1,200,1,0,0,0};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_blue_alert
	{
		displayName = "[TSR] Blue Alert";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\blue_alert.ogg",5,1,200,1,0,0,0};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_red_alert
	{
		displayName = "[TSR] Red Alert";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\red_alert.ogg",5,1,200,1,0,0,0};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_intruder_alert
	{
		displayName = "[TSR] Intruder Alert";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\intruder_alert.ogg",5,1,200,1,0,0,0};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_evacuation_klaxon
	{
		displayName = "[TSR] Evacuation Klaxon";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\evacuation_klaxon.ogg",5,1,200,1,0,0,0};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_electrical_arcs
	{
		displayName = "[TSR] Electrical Arcs";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\electrical_arcs.ogg",5,1,200,1,0,0,0};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_trench_whistle
	{
		displayName = "[TSR] Trench Whistle";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\trench_whistle.ogg",5,1,50,1,999,999,999};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_nid_laugh
	{
		displayName = "[TSR] Nid Laugh";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\nid_laugh.ogg",5,1,50,1,999,999,999};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_nid_speech_1
	{
		displayName = "[TSR] Nid Speech 1";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\nid_speech_1.ogg",5,1,50,1,999,999,999};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_nid_speech_2
	{
		displayName = "[TSR] Nid Speech 2";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\nid_speech_2.ogg",5,1,50,1,999,999,999};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_nid_roar_1
	{
		displayName = "[TSR] Nid Roar 1";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\nid_roar_1.ogg",5,1,50,1,999,999,999};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_nid_roar_2
	{
		displayName = "[TSR] Nid Roar 2";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\nid_roar_2.ogg",5,1,50,1,999,999,999};
		empty[] = {"",0,0,0,0,0,0,0};
	};
	class sr_sfx_nid_wheeze
	{
		displayName = "[TSR] Nid Wheeze";
		sounds[] = {"sound1"};
		sound1[] = {"sr_sfx\Sound\nid_wheeze.ogg",5,1,50,1,999,999,999};
		empty[] = {"",0,0,0,0,0,0,0};
	};
};
class CfgVehicles
{
	class Sound;
	class sr_sfx_electronic_alert_sys: Sound
	{
		author = "Tengu";
		scope = 2;
		sound = "sr_sfx_electronic_alert_sys";
		displayName = "[TSR] Electronic Alert System";
	};
	class sr_sfx_blue_alert: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_blue_alert";
		displayName = "[TSR] Blue Alert";
	};
	class sr_sfx_red_alert: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_red_alert";
		displayName = "[TSR] Red Alert";
	};
	class sr_sfx_intruder_alert: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_intruder_alert";
		displayName = "[TSR] Intruder Alert";
	};
	class sr_sfx_evacuation_klaxon: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_evacuation_klaxon";
		displayName = "[TSR] Evacuation Klaxon";
	};
	class sr_sfx_electrical_arcs: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_electrical_arcs";
		displayName = "[TSR] Electrical Arcs";
	};
	class sr_sfx_trench_whistle: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_trench_whistle";
		displayName = "[TSR] Trench Whistle";
	};
	class sr_sfx_nid_laugh: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_nid_laugh";
		displayName = "[TSR] Nid Laugh";
	};
	class sr_sfx_nid_speech_1: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_nid_speech_1";
		displayName = "[TSR] Nid Speech 1";
	};
	class sr_sfx_nid_speech_2: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_nid_speech_2";
		displayName = "[TSR] Nid Speech 2";
	};
	class sr_sfx_nid_roar_1: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_nid_roar_1";
		displayName = "[TSR] Nid Roar 1";
	};
	class sr_sfx_nid_roar_2: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_nid_roar_2";
		displayName = "[TSR] Nid Roar 2";
	};
	class sr_sfx_nid_wheeze: sr_sfx_electronic_alert_sys
	{
		sound = "sr_sfx_nid_wheeze";
		displayName = "[TSR] Nid Wheeze";
	};
};
