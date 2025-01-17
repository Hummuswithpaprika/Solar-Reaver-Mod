class CfgPatches
{
	class TIOW_Inf_SR_Primaris_DarkAngels
	{
		requiredAddons[]=
		{
			"TIOW_Inf_SR_Primaris"
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

class CfgVehicles
{
	class Primaris_SM_SR_1;
	class Primaris_SR_DarkAngels: Primaris_SM_SR_1
	{
		author="Hummus, Barbon";
		displayName="Primaris DA (Mk.10)";
		uniformClass="Primaris_SM_DarkAngels_W";
		hiddenSelectionsTextures[]=
		{
			"SR_Primaris\Textures\DA_PrimArmour.paa",
			"SR_Firstborn\Textures\DA_Armour1.paa"
		};
	};
};
class CfgWeapons
{
	class ItemInfo;
	class SR_MK10_Armor_Blackshield;
	class Primaris_SM_DarkAngels_W: SR_MK10_Armor_Blackshield
	{
		displayName="[TSR] Primaris MK.10 (Dark Angels)";
		class ItemInfo: ItemInfo
		{
			uniformClass="Primaris_SR_DarkAngels";
		};
	};
	class SR_MK10_Helmet_Blackshield;
	class Primaris_Helm_Main_SR_DarkAngels: SR_MK10_Helmet_Blackshield
	{
		author="Hummus, Barbon";
		displayName="[TSR] Primaris Mk.10 (Dark Angels)";
		hiddenSelections[]=
		{
			"Camo1"
		};
		hiddenSelectionsTextures[]=
		{
			"SR_Primaris\Textures\DA_PrimHelmet.paa"
		};
	};
	class DOS_Primaris_40k_Vest_Base;
	class Primaris_Vest_40K_SR_DarkAngels: DOS_Primaris_40k_Vest_Base 
	{
		author="Hummus, Barbon";
		scope=2;
		scopeArsenal=2;
		scopeCurator=2;
		displayName="[TSR] Primaris Mk.10 (Dark Angels)";
		model="Project_Primaris_D_Main\Models\Shoulder_Main.p3d";
		hiddenSelectionsTextures[]=
		{
			"SR_Primaris\Textures\DA_PrimArmour.paa"
		};
		class ItemInfo: ItemInfo
		{
			uniformModel="Project_Primaris_D_Main\Models\Shoulder_Main.p3d";
			hiddenSelections[]=
			{
				"Camo1"
			};
			hiddenSelectionsTextures[]=
			{
				"SR_Primaris\Textures\DA_PrimArmour.paa"
			};
		};
	};
};