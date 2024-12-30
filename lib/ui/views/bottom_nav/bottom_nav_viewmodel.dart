import 'package:stacked/stacked.dart';

class BottomNavViewModel extends IndexTrackingViewModel {
  final List<Map<String, dynamic>> menuList = [
    {
      "icon": "home",
      "activeIcon": "home_active",
    },
    {
      "icon": "services",
      "activeIcon": "services_active",
    },
    {
      "icon": "settings",
      "activeIcon": "settings_active",
    },
  ];
}
