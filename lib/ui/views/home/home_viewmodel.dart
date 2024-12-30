import 'package:beba_driver/app/app.locator.dart';
import 'package:beba_driver/services/home_service.dart';
import 'package:beba_driver/services/trips_service.dart';
import 'package:beba_driver/ui/views/home/models/delivery_model.dart';
import 'package:beba_driver/ui/views/home/models/user_model.dart';
import 'package:get_secure_storage/get_secure_storage.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final _homeService = locator<HomeService>();
  final _tripService = locator<TripsService>();

  bool _isBusy = false;
  @override
  bool get isBusy => _isBusy;
  UserDetails? _userDetails;
  UserDetails? get userDetails => _userDetails;
  MyDeliveries? _myDeliveries;
  MyDeliveries? get myDeliveries => _myDeliveries;
  final box = GetSecureStorage();
  String userId = "";
  Future<void> initialise() async {
    _isBusy = true;
    userId = box.read("userId") ?? "";
    notifyListeners();
    await getAvailableTrips();
    await getUserDetails();
  }

  getAvailableTrips() async {
    final res = await _tripService.getAvailableTrips();
    if (res.statusCode == 200) {
      _myDeliveries = MyDeliveries.fromJson(res.data);
    }
    _isBusy = false;
    notifyListeners();
  }

  getUserDetails() async {
    _isBusy = true;
    notifyListeners();
    final res = await _homeService.getUserDetails(userId: userId);
    if (res.statusCode == 200) {
      box.write("userDetails", res.data);
      _userDetails = UserDetails.fromJson(res.data);
      await getAvailableTrips();
    }
  }
}
