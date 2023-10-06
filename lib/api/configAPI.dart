const baseUrl =
    'https://asia-southeast2-telkominfra-f7a85.cloudfunctions.net/api';

//loading
String newloading = '$baseUrl/api/loading/';
String addCableToLoading = '$baseUrl/api/loading/cable';
String addSparekitToLoading = '$baseUrl/api/loading/kit';
String getAllLoading = '$baseUrl/api/loading';
String getLoadingById = '$baseUrl/api/loading';
String deleteLoading = '$baseUrl/api/loading';
String submitLoading = '$baseUrl/api/loading/submit';
String deleteCableFromLoading = '$baseUrl/api/loading/cable';
String deleteSparekitFromLoading = '$baseUrl//api/loading/kit';
String getAllTurnOverById = '$baseUrl/api/loading/turnover';

//off-loading
String getAllOffLoading = '$baseUrl/api/offloading';
String getOffLoadingById = '$baseUrl/api/offloading';
String offLoadingExisting = '$baseUrl/api/offloading/addCableExisting';
String offLoadingExistingKit = '$baseUrl/api/offloading/addKitExisting';
String deleteKitFromExisting = '$baseUrl/api/offloading/removeKitExisting';
String deleteCableFromExisting = '$baseUrl/api/offloading/removeCableExisting';
String submiOffLoadingExisting = '$baseUrl/api/offloading/submitExisting';

//new material
String newMaterial = '$baseUrl/api/offloadingNewMaterial/create';
String addCableToNewMaterial = '$baseUrl/api/offloadingNewMaterial/addCable';
String addKitToNewMaterial = '$baseUrl/api/offloadingNewMaterial/addKit';
String getAllNewMaterial = '$baseUrl/api/offloadingNewMaterial/all';
String getNewMaterialById = '$baseUrl/api/offloadingNewMaterial';
String deleteCableFromNewMaterial =
    '$baseUrl/api/offloadingNewMaterial/deleteCable';
String deleteKitFromNewMaterial =
    '$baseUrl/api/offloadingNewMaterial/deleteKit';
String submitNewMaterial = '$baseUrl/api/offloadingNewMaterial/submit';
String deleteNewMaterial = '$baseUrl/api/offloadingNewMaterial/delete';
String addEvidenceCable = '$baseUrl/api/offloadingNewMaterial/evidence/cable';
String addEvidenceKit = '$baseUrl/api/offloadingNewMaterial/evidence/kit';
String downloadEvidenceCable =
    '$baseUrl/api/offloadingNewMaterial/evidence/cable';
String downloadEvidenceKit = '$baseUrl/api/offloadingNewMaterial/evidence/kit';

//allCable
String getAllCable = '$baseUrl/api/spareCable/';
String getAllKit = '$baseUrl/api/spareKit/';

//Setting
String getUser = '$baseUrl/api/setting';
String editUser = '$baseUrl/api/setting';
String deleteUser = '$baseUrl/api/user';

//dashboard chart
String getChart = '$baseUrl/api/dashboard/chart/cable_type';

// Crud Spare Cable
String inputSpareCable = '$baseUrl/api/spareCable/create';

// Crud Spare Cable
String inputSpareKit = '$baseUrl/api/spareKit/create';
String getAllSpareKit = '$baseUrl/api/spareKit/getall';

//CRUD Kurs
String getAllKurs = '$baseUrl/api/kurs/get';
String editKurs = '$baseUrl/api/kurs/create';

// CRUD System
String inputSystem = '$baseUrl/api/system/create';
String editSystem = '$baseUrl/api/system/edit';
String getAllSystem = '$baseUrl/api/system/getall';
String hapusSystem = '$baseUrl/api/system/delete';

// CRUD Armoring Type
String inputArmoring = '$baseUrl/api/armoringType/create';
String editArmoring = '$baseUrl/api/armoringType/edit';
String getAllArmoring = '$baseUrl/api/armoringType/getall';
String hapusArmoring = '$baseUrl/api/armoringType/delete';

// CRUD Manufacturer
String inputManufacturer = '$baseUrl/api/manufacturer/create';
String getAllManufacturer = '$baseUrl/api/manufacturer/getall';
String hapusManufacturer = '$baseUrl/api/manufacturer/delete';
String editManufacturer = '$baseUrl/api/manufacturer/edit';

// CRUD Perusahaan
String inputPerusahaan = '$baseUrl/api/perusahaan/create';
String getAllPerusahaan = '$baseUrl/api/perusahaan/getall';
String hapusPerusahaan = '$baseUrl/api/perusahaan/delete';
String editPerusahaan = '$baseUrl/api/perusahaan/edit';

// CRUD Core Type
String inputCoreType = '$baseUrl/api/coreType/create';
String getAllCoreType = '$baseUrl/api/coreType/getall';
String hapusCoreType = '$baseUrl/api/coreType/delete';
String editCoreType = '$baseUrl/api/coreType/edit';

// CRUD Cable Type
String inputCableType = '$baseUrl/api/cableType/create';
String getAllCableType = '$baseUrl/api/cableType/getall';
String hapusCableType = '$baseUrl/api/cableType/delete';
String editCableType = '$baseUrl/api/cableType/edit';

// CRUD Location
String inputLocation = '$baseUrl/api/location/create';
String getAllLocation = '$baseUrl/api/location/getall';
String hapusLocation = '$baseUrl/api/location/delete';
String editLocation = '$baseUrl/api/location/edit';

// CRUD Unit
String inputUnit = '$baseUrl/api/unit/create';
String getAllUnit = '$baseUrl/api/unit/getall';
String hapusUnit = '$baseUrl/api/unit/delete';
String editUnit = '$baseUrl/api/unit/edit';

String getReportCable = '$baseUrl/api/report';
String getReportSpareKits = '$baseUrl/api/report/spare_kits';

String getTank1 = '$baseUrl/api/inventory/cable/TANK-1';
String getTank2 = '$baseUrl/api/inventory/cable/TANK-2';
String getTank3 = '$baseUrl/api/inventory/cable/TANK-3';
String getTank4 = '$baseUrl/api/inventory/cable/TANK-4';
String getTank5 = '$baseUrl/api/inventory/cable/TANK-5';
String getTank6 = '$baseUrl/api/inventory/cable/TANK-6';
String getTank7 = '$baseUrl/api/inventory/cable/TANK-7';
String getTank8 = '$baseUrl/api/inventory/cable/TANK-8';
String getTank9 = '$baseUrl/api/inventory/cable/TANK-9';
String getTank10 = '$baseUrl/api/inventory/cable/TANK-10';
String getTank11 = '$baseUrl/api/inventory/cable/TANK-11';
String getFloor = '$baseUrl/api/inventory/kit/FLOOR';
String getRefrigerator = '$baseUrl/api/inventory/kit/LEMARI PENDINGIN';
String getCage = '$baseUrl/api/inventory/kit/CAGE';
String getCage1 = '$baseUrl/api/inventory/kit/CAGE 1';
String getCage2 = '$baseUrl/api/inventory/kit/CAGE 2';
String getCage3 = '$baseUrl/api/inventory/kit/CAGE 3';
String getCage4 = '$baseUrl/api/inventory/kit/CAGE 4';
String getCage5 = '$baseUrl/api/inventory/kit/CAGE 5';
String getCage6 = '$baseUrl/api/inventory/kit/CAGE 6';
String getCage7 = '$baseUrl/api/inventory/kit/CAGE 7';
String getCage8 = '$baseUrl/api/inventory/kit/CAGE 8';
String getCage9 = '$baseUrl/api/inventory/kit/CAGE 9';
String getRakA1 = '$baseUrl/api/inventory/kit/RAK A1';
String getRakA2 = '$baseUrl/api/inventory/kit/RAK A2';
String getRakA3 = '$baseUrl/api/inventory/kit/RAK A3';
String getRakA4 = '$baseUrl/api/inventory/kit/RAK A4';
String getRakA5 = '$baseUrl/api/inventory/kit/RAK A5';
String getRakA6 = '$baseUrl/api/inventory/kit/RAK A6';
String getRakA7 = '$baseUrl/api/inventory/kit/RAK A7';
String getRakB1 = '$baseUrl/api/inventory/kit/RAK B1';
String getRakB2 = '$baseUrl/api/inventory/kit/RAK B2';
String getRakB3 = '$baseUrl/api/inventory/kit/RAK B3';
String getRakB4 = '$baseUrl/api/inventory/kit/RAK B4';
String getRakB5 = '$baseUrl/api/inventory/kit/RAK B5';
String getRakB6 = '$baseUrl/api/inventory/kit/RAK B6';
String getRakB7 = '$baseUrl/api/inventory/kit/RAK B7';
String getRakC1 = '$baseUrl/api/inventory/kit/RAK C1';
String getRakC2 = '$baseUrl/api/inventory/kit/RAK C2';
String getRakC3 = '$baseUrl/api/inventory/kit/RAK C3';
String getRakC4 = '$baseUrl/api/inventory/kit/RAK C4';
String getRakC5 = '$baseUrl/api/inventory/kit/RAK C5';
String getRakC6 = '$baseUrl/api/inventory/kit/RAK C6';
String getRakC7 = '$baseUrl/api/inventory/kit/RAK C7';
String getRak = '$baseUrl/api/inventory/kit/RAK';

String getIdUnit = '$baseUrl/api/unit/get';

//User Login
String userLogin = '$baseUrl/api/user/signin';
//register
String inputAkun = '$baseUrl/api/user/signup';
