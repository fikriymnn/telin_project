const RootRoute = "/";

const HomePageDisplayName = "Home";
const HomePageRoute = "/home";

const InventoryDisplayName = "Inventory";
const InventoryPageRoute = "/inventory";

const MasterDataDisplayName = "Master Data";
const MasterDataPageRoute = "/master-data";

const SystemDisplayName = "System";
const SystemPageRoute = "/system";

const KursDisplayName = "Kurs";
const KursPageRoute = "/kurs";

const ArmoringDisplayName = "Armoring Type";
const ArmoringPageRoute = "/Armoring Type";

const CableTypeDisplayName = "Cable Type";
const CableTypePageRoute = "/Cable Type";

const ManufacturerDisplayName = "Manufacturer";
const ManufacturerPageRoute = "/Manufacturer";

const CoreTypeDisplayName = "Core Type";
const CoreTypePageRoute = "/Core Type";

const LocationDisplayName = "Location";
const LocationPageRoute = "/Location";

const UnitDisplayName = "Unit";
const UnitPageRoute = "/Unit";
const EditUnitPageRoute = "/Unit/edit";

const CompanyDisplayName = "Company";
const CompanyPageRoute = "/Company";

const OrderDisplayName = "Order";
const OrderPageRoute = "/order";

const LoadingDisplayName = "Loading";
const LoadingPageRoute = "/Loading";

const OffLoadingDisplayName = "Off Loading";
const OffLoadingPageRoute = "/Off Loading";

const NewMaterialDisplayName = "New Material";
const NewMaterialPageRoute = "/New Material";

const ExistingMaterialDisplayName = "Existing Material";
const ExistingMaterialPageRoute = "/Existing Material";

const ReportDisplayName = "Report";
const ReportPageRoute = "/report";

const CableReportDisplayName = "Cable Report";
const CableReportPageRoute = "/Cable Report";

const NonCableReportDisplayName = "Non Cable Report";
const NonCableReportPageRoute = "/Non Cable Report";

const SettingsDisplayName = "Settings";
const SettingsPageRoute = "/settings";

const AuthenticationDisplayName = "Log Out";
const AuthenticationPageRoute = "/auth";

const DepoPageRoute = "/depo";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(HomePageDisplayName, HomePageRoute),
  MenuItem(InventoryDisplayName, InventoryPageRoute),
  MenuItem(MasterDataDisplayName, MasterDataPageRoute),
  MenuItem(SystemDisplayName, SystemPageRoute),
  MenuItem(KursDisplayName, KursPageRoute),
  MenuItem(ArmoringDisplayName, ArmoringPageRoute),
  MenuItem(CableTypeDisplayName, CableTypePageRoute),
  MenuItem(ManufacturerDisplayName, ManufacturerPageRoute),
  MenuItem(CoreTypeDisplayName, CoreTypePageRoute),
  MenuItem(LocationDisplayName, LocationPageRoute),
  MenuItem(UnitDisplayName, UnitPageRoute),
  MenuItem(CompanyDisplayName, CompanyPageRoute),
  MenuItem(OrderDisplayName, OrderPageRoute),
  MenuItem(LoadingDisplayName, LoadingPageRoute),
  MenuItem(OffLoadingDisplayName, OffLoadingPageRoute),
  MenuItem(NewMaterialDisplayName, NewMaterialPageRoute),
  MenuItem(ExistingMaterialDisplayName, ExistingMaterialPageRoute),
  MenuItem(ReportDisplayName, ReportPageRoute),
  MenuItem(SettingsDisplayName, SettingsPageRoute),
  MenuItem(AuthenticationDisplayName, AuthenticationPageRoute),
];
