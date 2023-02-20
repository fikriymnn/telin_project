const RootRoute = "/";

const HomePageDisplayName = "Home";
const HomePageRoute = "/home";

const InventoryDisplayName = "Inventory";
const InventoryPageRoute = "/inventory";

const MasterDataDisplayName = "Master Data";
const MasterDataPageRoute = "/master-data";

const OrderDisplayName = "Order";
const OrderPageRoute = "/order";

const ReportDisplayName = "Report";
const ReportPageRoute = "/report";

const SettingsDisplayName = "Settings";
const SettingsPageRoute = "/settings";

const AuthenticationDisplayName = "Log Out";
const AuthenticationPageRoute = "/auth";

class MenuItem {
  final String name;
  final String route;

  MenuItem(this.name, this.route);
}

List<MenuItem> sideMenuItems = [
  MenuItem(HomePageDisplayName, HomePageRoute),
  MenuItem(InventoryDisplayName, InventoryPageRoute),
  MenuItem(MasterDataDisplayName, MasterDataPageRoute),
  MenuItem(OrderDisplayName, OrderPageRoute),
  MenuItem(ReportDisplayName, ReportPageRoute),
  MenuItem(SettingsDisplayName, SettingsPageRoute),
  MenuItem(AuthenticationDisplayName, AuthenticationPageRoute),
];
