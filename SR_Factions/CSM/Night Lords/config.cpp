class CfgPatches
{
	class Tengu_Factions_CSM_NL
	{
		requiredAddons[]=
		{
			"TIOWSpaceMarines",
      "Steve_30k_Units",
      "Seb_SM_Melee_Mod"
		};
		requiredVersion=0.1;
		units[]=
		{
      "Tengu_WBKMelee_NL_Hammer",
      "Tengu_WBKMelee_NL_CSwordShd",
      "Tengu_WBKMelee_NL_CSword",
      "Tengu_WBKMelee_NL_PSword"
		};
		weapons[]=
		{
		};
	};
};

class cfgGroups
{  
  class EAST
  {
    class TIOW_ChaosSpaceMarines
    {
      class TIOW_CSM_NL_Squads
      {
        class Tengu_Additional_Units_O_NL_Breacher_Squad
        {
          name="Breacher Squad";
          faction="TIOW_CSM_NL_Squads";
          icon = "\A3\ui_f\data\map\markers\nato\o_inf.paa";
          side=0;
          class Unit0
          {
            side=0;
            vehicle="STEVE_30k_MK3_Sheild_NL";
            rank="PRIVATE";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="STEVE_30k_MK4_Sheild_NL";
            rank="PRIVATE";
            position[]={5,-5,0};
          };
          class Unit2
          {
            side=0;
            vehicle="STEVE_30k_MK4_Sheild_NL";
            rank="PRIVATE";
            position[]={-5,-5,0};
          };
          class Unit3
          {
            side=0;
            vehicle="STEVE_30k_MK4_Sheild_NL";
            rank="PRIVATE";
            position[]={10,-10,0};
          };
          class Unit4
          {
            side=0;
            vehicle="STEVE_30k_MK4_Sheild_NL";
            rank="PRIVATE";
            position[]={-10,-10,0};
          };
        };
        class Tengu_Additional_Units_O_NL_Chosen
        {
          name="Chosen";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_inf.paa";
          class Unit0
          {
            side=0;
            vehicle="TIOW_Sergeant_NL_1";
            rank="PRIVATE";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact_NL";
            rank="PRIVATE";
            position[]={5,-5,0};
          };
          class Unit2
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact_NL";
            rank="PRIVATE";
            position[]={-5,-5,0};
          };
          class Unit3
          {
            side=0;
            vehicle="TIOW_Plasmagunner_NL_5";
            rank="PRIVATE";
            position[]={10,-10,0};
          };
          class Unit4
          {
            side=0;
            vehicle="STEVE_30k_MK4_Rotor_NL";
            rank="PRIVATE";
            position[]={-10,-10,0};
          };
          class Unit5
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact_NL";
            rank="PRIVATE";
            position[]={15,-15,0};
          };
          class Unit6
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact2_NL";
            rank="PRIVATE";
            position[]={-15,-15,0};
          };
          class Unit7
          {
            side=0;
            vehicle="STEVE_30k_MK4_Melt_NL";
            rank="PRIVATE";
            position[]={20,-20,0};
          };
          class Unit8
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact_NL";
            rank="PRIVATE";
            position[]={-20,-20,0};
          };
          class Unit9
          {
            side=0;
            vehicle="TIOW_Tactical_NL_7";
            rank="PRIVATE";
            position[]={25,-25,0};
          };
        };
        class Tengu_Additional_Units_O_NL_Chosen_CQC
        {
          name="Chosen CQC";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_inf.paa";
          class Unit0
          {
            side=0;
            vehicle="TIOW_Sergeant_NL_1";
            rank="PRIVATE";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="STEVE_30k_MK3_HF_NL";
            rank="PRIVATE";
            position[]={5,-5,0};
          };
          class Unit2
          {
            side=0;
            vehicle="STEVE_30k_MK3_HF_NL";
            rank="PRIVATE";
            position[]={-5,-5,0};
          };
          class Unit3
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact_NL";
            rank="PRIVATE";
            position[]={10,-10,0};
          };
          class Unit4
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact_NL";
            rank="PRIVATE";
            position[]={-10,-10,0};
          };
          class Unit5
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact_NL";
            rank="PRIVATE";
            position[]={15,-15,0};
          };
          class Unit6
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact_NL";
            rank="PRIVATE";
            position[]={-15,-15,0};
          };
          class Unit7
          {
            side=0;
            vehicle="TIOW_Meltagunner_NL_3";
            rank="PRIVATE";
            position[]={20,-20,0};
          };
          class Unit8
          {
            side=0;
            vehicle="STEVE_30k_MK4_Rotor_NL";
            rank="PRIVATE";
            position[]={-20,-20,0};
          };
          class Unit9
          {
            side=0;
            vehicle="TIOW_Tactical_NL_1_Chaos";
            rank="PRIVATE";
            position[]={25,-25,0};
          };
        };
        class Tengu_Additional_Units_O_NL_Chosen_Volkite
        {
          name="Chosen Volkite";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_inf.paa";
          class Unit0
          {
            side=0;
            vehicle="TIOW_Sergeant_NL_1";
            rank="PRIVATE";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="STEVE_30k_MK4_Volkite_NL";
            rank="PRIVATE";
            position[]={5,-5,0};
          };
          class Unit2
          {
            side=0;
            vehicle="STEVE_30k_MK4_Volkite_NL";
            rank="PRIVATE";
            position[]={-5,-5,0};
          };
          class Unit3
          {
            side=0;
            vehicle="STEVE_30k_MK3_Volkite_NL";
            rank="PRIVATE";
            position[]={10,-10,0};
          };
        };
        class Tengu_Additional_Units_O_NL_Armoured_Column
        {
          name="Armoured Column";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_armor.paa";
          class Unit0
          {
            side=0;
            vehicle="TIOW_SM_Predator_NL";
            rank="PRIVATE";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="TIOW_SM_Razorback_NL";
            rank="PRIVATE";
            position[]={0,-15,0};
          };
          class Unit2
          {
            side=0;
            vehicle="TIOW_SM_Razorback_NL";
            rank="PRIVATE";
            position[]={0,-30,0};
          };
        };
        class Tengu_Additional_Units_O_NL_Rhino_w_Troops
        {
          name="Rhino w/ Troops";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_mech_inf.paa";
          class Unit0
          {
            side=0;
            vehicle="TIOW_SM_Rhino_NL";
            rank="SERGEANT";
            position[]={0,-0,0};
          };
					class Unit1
					{
						side = 0;
						vehicle = "TIOW_Sergeant_NL_1";
						rank = "SERGEANT";
						position[] = {15,0,0};
					};
					class Unit2
					{
						side = 0;
						vehicle = "TIOW_Meltagunner_NL_3";
						rank = "CORPORAL";
						position[] = {15,-5,0};
					};
					class Unit3
					{
						side = 0;
						vehicle = "TIOW_HeavyBolter_NL_4";
						rank = "PRIVATE";
						position[] = {15,-10,0};
					};
					class Unit4
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_5";
						rank = "PRIVATE";
						position[] = {15,-15,0};
					};
					class Unit5
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_4";
						rank = "PRIVATE";
						position[] = {15,-20,0};
					};
					class Unit6
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_3";
						rank = "PRIVATE";
						position[] = {20,0,0};
					};
					class Unit7
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_1_Chaos";
						rank = "PRIVATE";
						position[] = {20,-5,0};
					};
					class Unit8
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_1_Chaos";
						rank = "PRIVATE";
						position[] = {20,-10,0};
					};
					class Unit9
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_1";
						rank = "PRIVATE";
						position[] = {20,-15,0};
					};
        };
        class Tengu_Additional_Units_O_NL_Assault_Bikes
        {
          name="Assault Bikes";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_motor_inf.paa";
          class Unit0
          {
            side=0;
            vehicle="TIOW_Bike_NL_3";
            rank="PRIVATE";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="TIOW_Bike_NL_3";
            rank="PRIVATE";
            position[]={0,-15,0};
          };
          class Unit2
          {
            side=0;
            vehicle="TIOW_Bike_NL_3";
            rank="PRIVATE";
            position[]={0,-30,0};
          };
          class Unit3
          {
            side=0;
            vehicle="TIOW_Bike_NL_3";
            rank="PRIVATE";
            position[]={0,-45,0};
          };
        };
        class Tengu_Additional_Units_O_NL_Drop_Pod_Filled
        {
          name="Drop Pod (Filled)";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_air.paa";
          class Unit0
          {
            side=0;
            vehicle="TIOW_Drop_Pod_NL";
            rank="SERGEANT";
            position[]={0,-0,0};
          };
					class Unit1
					{
						side = 0;
						vehicle = "TIOW_Sergeant_NL_1";
						rank = "SERGEANT";
						position[] = {15,0,0};
					};
					class Unit2
					{
						side = 0;
						vehicle = "TIOW_Meltagunner_NL_3";
						rank = "CORPORAL";
						position[] = {15,-5,0};
					};
					class Unit3
					{
						side = 0;
						vehicle = "TIOW_HeavyBolter_NL_4";
						rank = "PRIVATE";
						position[] = {15,-10,0};
					};
					class Unit4
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_5";
						rank = "PRIVATE";
						position[] = {15,-15,0};
					};
					class Unit5
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_4";
						rank = "PRIVATE";
						position[] = {15,-20,0};
					};
					class Unit6
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_3";
						rank = "PRIVATE";
						position[] = {20,0,0};
					};
					class Unit7
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_1_Chaos";
						rank = "PRIVATE";
						position[] = {20,-5,0};
					};
					class Unit8
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_1_Chaos";
						rank = "PRIVATE";
						position[] = {20,-10,0};
					};
					class Unit9
					{
						side = 0;
						vehicle = "TIOW_Tactical_NL_1";
						rank = "PRIVATE";
						position[] = {20,-15,0};
					};
        };
        class Tengu_Additional_Units_O_NL_Land_Speeder_HB
        {
          name="Land Speeder (HB)";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_air.paa";
          class Unit0
          {
            side=0;
            vehicle="TIOW_NL_Storm";
            rank="PRIVATE";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="TIOW_HeavyBolter_NL_4";
            rank="PRIVATE";
            position[]={10,0,0};
          };
          class Unit2
          {
            side=0;
            vehicle="TIOW_HeavyBolter_NL_4";
            rank="PRIVATE";
            position[]={10,-5,0};
          };
          class Unit3
          {
            side=0;
            vehicle="TIOW_HeavyBolter_NL_4";
            rank="PRIVATE";
            position[]={15,0,0};
          };
          class Unit4
          {
            side=0;
            vehicle="TIOW_HeavyBolter_NL_4";
            rank="PRIVATE";
            position[]={15,-5,0};
          };
        };
        class Tengu_Additional_Units_O_NL_Recon_Squad_Small
        {
          name="Recon Squad (Small)";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_recon.paa";
          class Unit0
          {
            side=0;
            vehicle="STEVE_30k_MK3_Tact2_NL";
            rank="COLONEL";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact2_NL";
            rank="PRIVATE";
            position[]={5,-5,0};
          };
          class Unit2
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact2_NL";
            rank="PRIVATE";
            position[]={-5,-5,0};
          };
        };
        class Tengu_Additional_Units_O_NL_Recon_Squad
        {
          name="Recon Squad";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_recon.paa";
          class Unit0
          {
            side=0;
            vehicle="STEVE_30k_MK3_Tact2_NL";
            rank="COLONEL";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact2_NL";
            rank="PRIVATE";
            position[]={5,-5,0};
          };
          class Unit2
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact2_NL";
            rank="PRIVATE";
            position[]={-5,-5,0};
          };
          class Unit3
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact2_NL";
            rank="PRIVATE";
            position[]={10,-10,0};
          };
          class Unit4
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact2_NL";
            rank="PRIVATE";
            position[]={-10,-10,0};
          };
          class Unit5
          {
            side=0;
            vehicle="STEVE_30k_MK4_Tact2_NL";
            rank="PRIVATE";
            position[]={15,-15,0};
          };
        };
        class Tengu_Additional_Units_O_NL_Havoc_Squad_HB
        {
          name="Havoc Squad (HB)";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_support.paa";
          class Unit0
          {
            side=0;
            vehicle="STEVE_30k_MK4_SgtPlas_NL";
            rank="MAJOR";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="TIOW_HeavyBolter_NL_4";
            rank="PRIVATE";
            position[]={5,-5,0};
          };
          class Unit2
          {
            side=0;
            vehicle="TIOW_HeavyBolter_NL_4";
            rank="PRIVATE";
            position[]={-5,-5,0};
          };
          class Unit3
          {
            side=0;
            vehicle="TIOW_HeavyBolter_NL_4";
            rank="PRIVATE";
            position[]={10,-10,0};
          };
          class Unit4
          {
            side=0;
            vehicle="TIOW_Tactical_NL_1";
            rank="PRIVATE";
            position[]={-10,-10,0};
          };
          class Unit5
          {
            side=0;
            vehicle="TIOW_Tactical_NL_1";
            rank="PRIVATE";
            position[]={15,-15,0};
          };
        };
        class Tengu_Additional_Units_O_NL_Havoc_Squad_Mixed
        {
          name="Havoc Squad (Mixed)";
          faction="TIOW_CSM_NL_Squads";
          side=0;
          icon = "\A3\ui_f\data\map\markers\nato\o_support.paa";
          class Unit0
          {
            side=0;
            vehicle="STEVE_30k_MK4_SgtPlas_NL";
            rank="MAJOR";
            position[]={0,-0,0};
          };
          class Unit1
          {
            side=0;
            vehicle="TIOW_HeavyBolter_NL_4";
            rank="PRIVATE";
            position[]={5,-5,0};
          };
          class Unit2
          {
            side=0;
            vehicle="TIOW_Tactical_NL_1";
            rank="PRIVATE";
            position[]={-5,-5,0};
          };
          class Unit3
          {
            side=0;
            vehicle="TIOW_Tactical_NL_1";
            rank="PRIVATE";
            position[]={10,-10,0};
          };
          class Unit4
          {
            side=0;
            vehicle="STEVE_30k_MK4_Las_NL";
            rank="PRIVATE";
            position[]={-10,-10,0};
          };
          class Unit5
          {
            side=0;
            vehicle="STEVE_30k_MK3_AutoCan_NL";
            rank="PRIVATE";
            position[]={15,-15,0};
          };
        };
      };
    };
  };
};


class TIOW_Tactical_NL_5;
class cfgVehicles {
	class Tengu_WBKMelee_NL_Hammer: TIOW_Tactical_NL_5
	{
		faction = "TIOW_ChaosSpaceMarines";
		editorSubcategory = "WBK_MeleeAi_SPACE_MARINES";
		author = "WebKnight";
		scope = 2;
		scopeCurator = 2;
		scopeArsenal = 2;
		displayName = "(Night Lords) Captain, Thunder Hammer";
		cost = 200000;
		camouflage = 1.5;
		sensitivity = 5;
		threat[] = {1,1,0.8};
		uniformClass = "TIOW_Mk4PowerArmor_1_NL";
		backpack = "TIOW_Chaos2Powerpack_NL";
		weapons[] = {"Web_Melee_ThunderHammer_chaos","Throw","Put"};
		magazines[] = {};
		items[] = {"FirstAidKit","FirstAidKit","FirstAidKit"};
		linkedItems[] = {"TIOW_ChaosLimbs_NL","TIOW_MK4Helmet_NL","ItemMap","ItemCompass","ItemWatch","ItemRadio","ItemGPS"};
	};
	class Tengu_WBKMelee_NL_CSwordShd: Tengu_WBKMelee_NL_Hammer
	{
		displayName = "(Night Lords) Shield, Chainsword";
		weapons[] = {"Web_Melee_Chain_Test","Throw","Put"};
	};
	class Tengu_WBKMelee_NL_CSword: Tengu_WBKMelee_NL_Hammer
	{
		displayName = "(Night Lords) Chainsword";
		weapons[] = {"Web_Melee_Chain_Sword_5","Throw","Put"};
	};
	class Tengu_WBKMelee_NL_PSword: Tengu_WBKMelee_NL_Hammer
	{
		displayName = "(Night Lords) Power sword";
		weapons[] = {"Web_Melee_PS_4","Throw","Put"};
	};
};