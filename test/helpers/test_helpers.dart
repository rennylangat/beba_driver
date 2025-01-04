import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:beba_driver/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:beba_driver/services/api_client_service.dart';
import 'package:beba_driver/services/auth_service.dart';
import 'package:beba_driver/services/device_info_service.dart';
import 'package:beba_driver/services/home_service.dart';
import 'package:beba_driver/services/trips_service.dart';
// @stacked-import

import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<NavigationService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<BottomSheetService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DialogService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<ApiClientService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<AuthService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<DeviceInfoService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<HomeService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<TripsService>(onMissingStub: OnMissingStub.returnDefault),
  MockSpec<MoneyConverterService>(onMissingStub: OnMissingStub.returnDefault),
// @stacked-mock-spec
])
void registerServices() {
  getAndRegisterNavigationService();
  getAndRegisterBottomSheetService();
  getAndRegisterDialogService();
  getAndRegisterApiClientService();
  getAndRegisterAuthService();
  getAndRegisterDeviceInfoService();
  getAndRegisterHomeService();
  getAndRegisterTripsService();
  getAndRegisterMoneyConverterService();
// @stacked-mock-register
}

MockNavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

MockBottomSheetService getAndRegisterBottomSheetService<T>({
  SheetResponse<T>? showCustomSheetResponse,
}) {
  _removeRegistrationIfExists<BottomSheetService>();
  final service = MockBottomSheetService();

  when(service.showCustomSheet<T, T>(
    enableDrag: anyNamed('enableDrag'),
    enterBottomSheetDuration: anyNamed('enterBottomSheetDuration'),
    exitBottomSheetDuration: anyNamed('exitBottomSheetDuration'),
    ignoreSafeArea: anyNamed('ignoreSafeArea'),
    isScrollControlled: anyNamed('isScrollControlled'),
    barrierDismissible: anyNamed('barrierDismissible'),
    additionalButtonTitle: anyNamed('additionalButtonTitle'),
    variant: anyNamed('variant'),
    title: anyNamed('title'),
    hasImage: anyNamed('hasImage'),
    imageUrl: anyNamed('imageUrl'),
    showIconInMainButton: anyNamed('showIconInMainButton'),
    mainButtonTitle: anyNamed('mainButtonTitle'),
    showIconInSecondaryButton: anyNamed('showIconInSecondaryButton'),
    secondaryButtonTitle: anyNamed('secondaryButtonTitle'),
    showIconInAdditionalButton: anyNamed('showIconInAdditionalButton'),
    takesInput: anyNamed('takesInput'),
    barrierColor: anyNamed('barrierColor'),
    barrierLabel: anyNamed('barrierLabel'),
    customData: anyNamed('customData'),
    data: anyNamed('data'),
    description: anyNamed('description'),
  )).thenAnswer((realInvocation) =>
      Future.value(showCustomSheetResponse ?? SheetResponse<T>()));

  locator.registerSingleton<BottomSheetService>(service);
  return service;
}

MockDialogService getAndRegisterDialogService() {
  _removeRegistrationIfExists<DialogService>();
  final service = MockDialogService();
  locator.registerSingleton<DialogService>(service);
  return service;
}

MockApiClientService getAndRegisterApiClientService() {
  _removeRegistrationIfExists<ApiClientService>();
  final service = MockApiClientService();
  locator.registerSingleton<ApiClientService>(service);
  return service;
}

MockAuthService getAndRegisterAuthService() {
  _removeRegistrationIfExists<AuthService>();
  final service = MockAuthService();
  locator.registerSingleton<AuthService>(service);
  return service;
}

MockDeviceInfoService getAndRegisterDeviceInfoService() {
  _removeRegistrationIfExists<DeviceInfoService>();
  final service = MockDeviceInfoService();
  locator.registerSingleton<DeviceInfoService>(service);
  return service;
}

MockHomeService getAndRegisterHomeService() {
  _removeRegistrationIfExists<HomeService>();
  final service = MockHomeService();
  locator.registerSingleton<HomeService>(service);
  return service;
}

MockTripsService getAndRegisterTripsService() {
  _removeRegistrationIfExists<TripsService>();
  final service = MockTripsService();
  locator.registerSingleton<TripsService>(service);
  return service;
}

// @stacked-mock-create

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
