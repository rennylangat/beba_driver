import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/app/app.router.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final box = GetSecureStorage();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    await checkLogin();
  }

  checkLogin() async {
    if (box.read("token") != null) {
      _navigationService.replaceWithBottomNavView();
    } else if (box.read("firstTime") == null || box.read("firstTime") == true) {
      _navigationService.replaceWithIntroView();
    } else {
      _navigationService.replaceWithLoginView();
    }
  }
}
