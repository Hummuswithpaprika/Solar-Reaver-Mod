// For all 3 files replace:
// "TSR" with the full chapter name eg "TSR"
// "TSR" with a shorthand chapter name, eg "TSR"
// "TSR" with an acronym or short identifier, eg "TSR"
// These MUST be consistent throughout all 3 files or it will not function. Texture files are made using arma 3 tool's texview 2 saved as .paa.
// DO NOT UNDER ANY CIRCUMSTANCE CHANGE ANYTHING THAT HAS "UM" OR "Ultra" IN IT, THESE ARE THE LINKS TO THE MODELS
// Replace any mention of [ID] with your Chapter Prefix WITHOUT Brackets

class CfgPatches
{
	class TIOW_Inf_SR_Primaris
	{
		requiredAddons[]=
		{
			"A3_Data_F",
			"TIOWSpaceMarines",
			"Project_Primaris_Dos"
		};
		requiredVersion=0.1;
		units[]=
		{
		};
		weapons[]=
		{
		};
	};
};

class CfgEditorCategories
{
	class EdCategory_SR
	{
  	displayName = "[TSR] Solar Reavers";
	};
};

class CfgEditorSubcategories
{
	class EdSubcat_SR_Primaris
	{
		displayName = "Primaris Marines";
	};
};

#include "CfgWeapons.hpp"

#include "CfgVehicles.hpp"