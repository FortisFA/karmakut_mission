
/*
 * Set the cargo size of any object. Has global effect.
 * Adds the load action menu if necessary.
 * Negative size makes unloadable.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Cargo size <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, 3] call ace_cargo_fnc_setSize

  * Set the cargo space of any object. Has global effect.
 * Adds the cargo action menu if necessary.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Cargo space <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [vehicle, 20] call ace_cargo_fnc_setSpace
  */
repair_buildings = [];

Arsenal_typename = "B_supplyCrate_F"; 

medical_vehicles = [
    "vtx_HH60",
    "B_T_Truck_01_medical_F",
    "B_Truck_01_medical_F",
    "C_Van_02_medevac_F",
    "CUP_B_BMP2_AMB_CDF",
    "CUP_B_BMP2_AMB_CZ_Des",
    "CUP_B_BMP2_AMB_CZ",
    "CUP_B_FV432_GB_Ambulance",
    "CUP_B_HMMWV_Ambulance_ACR",
    "CUP_B_HMMWV_Ambulance_USA",
    "CUP_B_HMMWV_Ambulance_USMC",
    "CUP_B_LR_Ambulance_CZ_D",
    "CUP_B_LR_Ambulance_CZ_W",
    "CUP_B_LR_Ambulance_GB_D",
    "CUP_B_LR_Ambulance_GB_W",
    "CUP_B_S1203_Ambulance_CDF",
    "CUP_B_UH1Y_MEV_USMC",
    "CUP_B_UH60M_Unarmed_FFV_MEV_US",
    "CUP_O_BMP2_AMB_CHDKZ",
    "CUP_O_BMP2_AMB_sla",
    "CUP_O_LR_Ambulance_TKA",
    "CUP_O_M113_Med_TKA",
    "gm_gc_airforce_mi2sr",
    "gm_gc_army_ural375d_medic_win",
    "gm_gc_army_ural375d_medic",
    "gm_ge_airforce_do28d2_medevac",
    "gm_ge_army_u1300l_medic_win_rc",
    "gm_ge_army_u1300l_medic",
    "I_E_Truck_02_Medical_F",
    "I_E_Van_02_medevac_F",
    "O_T_Truck_03_medical_ghex_F",
    "O_Truck_03_medical_F",
    "RHS_UH60M_MEV_d",
    "RHS_UH60M_MEV",
    "RHS_UH60M_MEV2_d",
    "RHS_UH60M_MEV2",
    "rhsusf_M1085A1P2_B_D_Medical_fmtv_usarmy",
    "rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy",
    "rhsusf_m113_usarmy_medical",
    "rhsusf_m113d_usarmy_medical",
    "rhsusf_M1230a1_usarmy_d",
    "rhsusf_M1230a1_usarmy_wd",
    "UK3CB_BAF_LandRover_Amb_FFR_Green_A_MTP",
    "UK3CB_BAF_LandRover_Amb_FFR_Sand_A_DDPM",
    "uns_ch47a_medevac",
    "uns_H13_medevac_CAV",
    "uns_M577_amb",
    "uns_uh1D_med"
];

// Building classnames which also function as ACE medical facilities.
medical_facilities = [
    "Land_Medevac_house_V1_F",
    "Land_Medevac_HQ_V1_F",
    "Land_MedicalTent_01_white_generic_outer_F", // make this entry match the Field Hospital classname specified by `karma_deployableFieldHospitals_shared_fieldHospitalClassname`
    "LAND_uns_army_med",
    "LAND_uns_tent3mash",
    "uns_mash_main",
    "uns_mash",
    "US_Tent_2",
    "US_Tent_MASH"
];

// Classnames of ACE3 crates (which have to be in the unit preset as well).
ace_crates = [
    "ACE_Box_82mm_Mo_HE",
    "ACE_Box_82mm_Mo_Illum",
    "ACE_Box_82mm_Mo_Smoke",
    "ACE_medicalSupplyCrate_advanced"
];
// sets which objects can be carried
ace_canCarry = [
  "Land_MetalBarrel_F",
  "CargoNet_01_barrels_F"
];
// analog to the above but dragging
ace_canDrag = [
  "Land_MetalBarrel_F",
  "CargoNet_01_barrels_F"
];

//which type of barrel to spawn
Small_Barrel = "Land_MetalBarrel_F";
Bigger_Barrel = "CargoNet_01_barrels_F";

// max number of barrels factory will spawn
Resource_Cap_Factory = 5;

// chance that factory will spawn smaller barrel
Small_Barrel_Chance = 50;

//buildings in which supplies will spawn
Factory_Buildings = ["Land_i_Shed_Ind_F"];

MAX_FOBS = 5;
MAX_COPS = 10;

FOB = "Land_Cargo_HQ_V1_F";

//Sets FOB in transit Vehicle Type
FOBTransit = "B_T_Truck_01_box_F";

// COP Building Type
COP = "Land_Cargo_House_V1_F";

//Sets COP in transit Vehicle Type
COPTransit = "rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy";


//which type of barrel to spawn
Small_Barrel = "Land_MetalBarrel_F";
Bigger_Barrel = "CargoNet_01_barrels_F";

// max number of barrels factory will spawn
Resource_Cap_Factory = 5;

// chance that factory will spawn smaller barrel
Small_Barrel_Chance = 75;

//buildings in which supplies will spawn
Factory_Buildings = ["Land_i_Shed_Ind_F"];

MAX_FOBS = 5;
MAX_COPS = 10;

StaticWeapons = [
 ["RHS_Stinger_AA_pod_WD", 100],
 ["RHS_M2StaticMG_WD", 100],
 ["RHS_M2StaticMG_MiniTripod_WD", 100],
 ["RHS_TOW_TriPod_WD", 100],
 ["RHS_MK19_TriPod_WD", 100]
];
WallsAndGates = [
["Land_New_WiredFence_5m_F", 100],
["Land_New_WiredFence_10m_F", 100],
["Land_Razorwire_F", 100],
["Land_BarGate_F", 100],
["Land_DragonsTeeth_01_4x2_new_F", 100],
["Land_DragonsTeeth_01_1x1_new_F", 100]
];
SandbagBunkers = [
["UK3CB_Nest", 100],
["Land_BagBunker_Small_F", 100],
["Land_BagBunker_Large_F", 100]
];
SandbagWallsTall = [
["Land_SandbagBarricade_01_half_F", 100],
["Land_SandbagBarricade_01_F", 100],
["Land_SandbagBarricade_01_hole_F", 100]
];
Sandbags = [
["Land_BagFence_Corner_F", 100],
["Land_BagFence_End_F", 100],
["Land_BagFence_Long_F", 100],
["Land_BagFence_Round_F", 100],
["Land_BagFence_Short_F", 100]
];
HbarrierWall = [
["Land_HBarrierWall_corridor_F", 100],
["Land_HBarrierWall_corner_F", 100],
["Land_HBarrierWall6_F", 100],
["Land_HBarrierWall4_F", 100]
];
CamoNets = [
["CamoNet_BLUFOR_F", 100],
["CamoNet_BLUFOR_open_F", 100],
["CamoNet_BLUFOR_big_F", 100]
];
Lights = [
["Land_Sawmill_01_illuminati_tower_F", 100],
["TFAR_Land_Communication_F", 100],
["Land_PortableLight_double_F", 100],
["Land_PortableLight_single_F", 100],
["Land_LampAirport_F", 100]
];
HBarrierBlocks = [
["Land_HBarrier_3_F", 100],
["Land_HBarrier_5_F", 100],
["Land_HBarrier_1_F", 100]
];
AirportLamps = [
["Land_PortableHelipadLight_01_F", 100],
["PortableHelipadLight_01_green_F", 100],
["PortableHelipadLight_01_blue_F", 100],
["PortableHelipadLight_01_red_F", 100],
["PortableHelipadLight_01_white_F", 100],
["PortableHelipadLight_01_yellow_F", 100]
];
Bunkers = [
["Land_HBarrierTower_F", 100],
["Land_Bunker_01_tall_F", 100],
["Land_Bunker_01_small_F", 100],
["Land_HBarrier_01_tower_green_F", 100]
];
MilitaryBuildings = [
["Land_Cargo_Patrol_V1_F", 100],
["Land_Cargo_Tower_V1_F", 100],
["Land_TentHangar_V1_F", 100],
["Land_MedicalTent_01_NATO_generic_open_F", 100]
];
MedicalBuildings = [
["Land_Medevac_HQ_V1_F", 100],
["Land_Medevac_house_V1_F", 100]
];
RepairPoints = [
["B_Slingload_01_Ammo_F", 100],
["B_Slingload_01_Fuel_F", 100],
["B_Slingload_01_Repair_F", 100]
];
MedicalVehicle = [
["rhsusf_m113_usarmy_medical", 100],
["RHS_UH60M_MEV2", 100]
];
APC = [
["rhsusf_stryker_m1132_m2_wd", 100],
["rhsusf_stryker_m1127_m2_wd", 100],
["rhsusf_stryker_m1126_mk19_wd", 100],
["rhsusf_stryker_m1126_m2_wd", 100]
];
Arty = [
["RHS_M119_WD", 100],
["rhsusf_m109_usarmy", 100],
["RHS_M252_WD", 100]
];
LightVehicles = [
["rhsusf_m1025_w_m2", 100],
["rhsusf_m1025_w_mk19", 100],
["rhsusf_m1025_w", 100],
["rhsusf_m998_w_2dr_halftop", 100],
["rhsusf_mrzr4_d", 100]
];
TransportRotary = [
["RHS_CH_47F", 100],
["RHS_MELB_MH6M", 100],
["vtx_UH60M", 100],
["RHS_UH60M", 100]
];
CASRotary = [
["RHS_AH64D_wd", 100],
["RHS_MELB_AH6M", 100],
["vtx_MH60M", 100]
];
IFVs = [
["RHS_M2A3_BUSKIII_wd", 100],
["RHS_M2A2_BUSKI_WD", 100],
["RHS_M6_wd", 100],
["rhsusf_M1117_W", 100]
];
MRAPs = [
["rhsusf_M1220_usarmy_wd", 100],
["rhsusf_M1220_M2_usarmy_wd", 100],
["rhsusf_M1220_MK19_usarmy_wd", 100],
["rhsusf_m1240a1_usarmy_wd", 100],
["rhsusf_m1240a1_m2_usarmy_wd", 100],
["rhsusf_m1240a1_mk19_usarmy_wd", 100]
];
Tanks = [
["rhsusf_m1a2sep2wd_usarmy", 100],
["rhsusf_m1a2sep1tuskiiwd_usarmy", 100]
];
Logistics = [
["rhsusf_M1078A1R_SOV_M2_D_fmtv_socom", 100],
["rhsusf_M977A4_REPAIR_usarmy_wd", 100],
["rhsusf_M977A4_BKIT_M2_usarmy_wd", 100],
["rhsusf_M977A4_BKIT_usarmy_wd", 100]
];
Trucks = [
["rhsusf_M1083A1P2_B_WD_fmtv_usarmy", 100],
["rhsusf_M1083A1P2_B_WD_flatbed_fmtv_usarmy", 100],
["rhsusf_M1083A1P2_B_M2_WD_fmtv_usarmy", 100],
["rhsusf_M1083A1P2_B_M2_WD_flatbed_fmtv_usarmy", 100]
];
ResourceExchange = [
["CargoNet_01_barrels_F", 500],
["Land_MetalBarrel_F", 100]
];
Planes = [
["USAF_C17", 100],
["USAF_AC130U", 100],
["USAF_A10", 100],
["RHSGREF_A29B_HIDF", 100]
];
