import 'package:beba_driver/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:beba_driver/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:beba_driver/ui/views/bids/bids_view.dart';
import 'package:beba_driver/ui/views/home/home_view.dart';
import 'package:beba_driver/ui/views/intro/intro_view.dart';
import 'package:beba_driver/ui/views/login/login_view.dart';
import 'package:beba_driver/ui/views/order_details/order_details_view.dart';
import 'package:beba_driver/ui/views/profile/profile_view.dart';
import 'package:beba_driver/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: IntroView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: OrderDetailsView),
    MaterialRoute(page: BidsView),
    MaterialRoute(page: ProfileView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
