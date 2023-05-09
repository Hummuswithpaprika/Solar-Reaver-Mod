class CfgPatches
{
	class TIOW_Inf_SR_Salamanders
	{
		requiredAddons[]=
		{
			"TIOW_Inf_SR"
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
	class TIOW_MK7_Tact_SR_BS;
	class TIOW_MK7_Tact_SR_SAL: TIOW_MK7_Tact_SR_BS
	{
		author="Strixus";
		displayName="Tactical Marine (MK. VII)";
		uniformClass="SR_MK7_Armor_Salamanders"; // This will be the classname of the PowerArmor, as seen in Weapons.HPP
		hiddenSelectionsTextures[]=
		{
			"SR_FirstBorn\Textures\SAL_Armour1.paa",
			"SR_FirstBorn\Textures\SR_Armour2.paa"
		};
	};
};
class CfgWeapons
{
	class ItemInfo;
	class TIOW_MK7PowerArmor_1_WS;
	class SR_MK7_Armor_Salamanders: TIOW_MK7PowerArmor_1_WS
	{
		author="Strixus";
		displayName="[SR] MK 7 Power Armor (TSR Salamanders)";
		class ItemInfo: ItemInfo
		{
			uniformClass="TIOW_MK7_Tact_SR_SAL"; // This will be the classname of a placeable unit, as seen in Vehicles.HPP
		};
	};
	class SR_MK2_Shoulders_Blackshield;
	class SR_MK2_Shoulders_Salamanders : SR_MK2_Shoulders_Blackshield
	{
		author="Strixus";
		displayName="[SR] MK 2 Pauldrons (TSR Salamanders)";
		hiddenSelectionsTextures[] =
		{
			"SR_FirstBorn\Textures\SAL_Armour1.paa",
			"SR_FirstBorn\Textures\SR_Armour2.paa"
		};
	};
	class TIOW_MK7Helmet_UM;
	class SR_MK7_Helmet_Salamanders: TIOW_MK7Helmet_UM
	{
		author="Strixus";
		displayName="[SR] MK 7 Helmet (TSR Salamanders)";
		optreVarietys[]=
		{
			"",
			"_dp",
			"_broken"
		};
		optreHUDStyle="ODST_1";
		hiddenSelectionsTextures[]=
		{
			"SR_FirstBorn\Textures\SAL_Helmet.paa"
		};
	};
};