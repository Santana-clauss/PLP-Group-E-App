import 'package:shopeasy/views/screens/dashboard.dart';
import 'package:get/get.dart';
import 'package:shopeasy/views/screens/login.dart';

class Routes {
  static var routes = [
    GetPage(name: "/home", page: () => DashboardPage()),
    //GetPage(name: "/", page: () => ()),
    GetPage(name: "/", page: () => LoginScreen()),



  ];
}
