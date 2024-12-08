import 'package:beba_driver/app/app.bottomsheets.dart';
import 'package:beba_driver/app/app.dialogs.dart';
import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/app/app.router.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();
  runApp(const MainApp());
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
    );
  }
}
