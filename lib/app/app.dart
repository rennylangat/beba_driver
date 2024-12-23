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
import 'package:beba_driver/ui/views/bottom_nav/bottom_nav_view.dart';
import 'package:beba_driver/ui/views/basic_info/basic_info_view.dart';
import 'package:beba_driver/services/api_client_service.dart';
import 'package:beba_driver/services/auth_service.dart';
import 'package:beba_driver/services/device_info_service.dart';
import 'package:beba_driver/ui/views/otp/otp_view.dart';
import 'package:beba_driver/services/home_service.dart';
import 'package:beba_driver/services/trips_service.dart';
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
    MaterialRoute(page: BottomNavView),
    MaterialRoute(page: BasicInfoView),
    MaterialRoute(page: OtpView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiClientService),
    LazySingleton(classType: AuthService),
    LazySingleton(classType: DeviceInfoService),
    LazySingleton(classType: HomeService),
    LazySingleton(classType: TripsService),
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
