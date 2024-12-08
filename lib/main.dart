import 'package:beba_driver/app/app.bottomsheets.dart';
import 'package:beba_driver/app/app.dialogs.dart';
import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/app/app.router.dart';
import 'package:beba_driver/ui/common/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await InAppUpdate.checkForUpdate().then((info) async {
      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        if (info.immediateUpdateAllowed) {
          await InAppUpdate.performImmediateUpdate();
        } else if (info.flexibleUpdateAllowed) {
          await InAppUpdate.startFlexibleUpdate().then((value) async {
            if (value == AppUpdateResult.success) {
              await InAppUpdate.completeFlexibleUpdate();
            }
          });
        } else {
          await InAppUpdate.startFlexibleUpdate().then((value) async {
            await InAppUpdate.completeFlexibleUpdate();
          });
        }
      }
    });
  } catch (e) {
    debugPrint("Error has occured while updating app: $e");
  }
  await GetSecureStorage.init(container: "beba_customer");

  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  setUpLoader();
  runApp(const MainApp());
}

setUpLoader() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = MyColor.primary
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..maskColor = MyColor.primary90.withOpacity(0.5)
    ..errorWidget = const Icon(Icons.error, color: Colors.red, size: 64)
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..displayDuration = const Duration(milliseconds: 2000)
    ..dismissOnTap = false;
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Beba Driver",
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        StackedService.routeObserver,
      ],
      builder: EasyLoading.init(),
    );
  }
}
