import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  static final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin();

  /// Gets a unique device identifier that persists across app reinstalls
  Future<String> getDeviceId() async {
    try {
      if (Platform.isAndroid) {
        return _getAndroidDeviceId();
      } else if (Platform.isIOS) {
        return _getIosDeviceId();
      }
      throw UnsupportedError('Unsupported platform');
    } catch (e) {
      // Fallback to timestamp-based ID if device info cannot be retrieved
      return _getFallbackDeviceId();
    }
  }

  Future<String> getSimpleDeviceId() async {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  Future<String> _getAndroidDeviceId() async {
    final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
    // Combine multiple identifiers for better uniqueness
    return '${androidInfo.id}_${androidInfo.brand}_${androidInfo.model}'
        .replaceAll(' ', '_')
        .toLowerCase();
  }

  Future<String> _getIosDeviceId() async {
    final IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
    return iosInfo.identifierForVendor ?? _getFallbackDeviceId();
  }

  String _getFallbackDeviceId() {
    return 'fallback_${DateTime.now().millisecondsSinceEpoch}';
  }

  /// Gets readable device information for logging/debugging
  Future<Map<String, dynamic>> getDeviceInfo() async {
    try {
      if (Platform.isAndroid) {
        final AndroidDeviceInfo androidInfo = await _deviceInfo.androidInfo;
        return {
          'platform': 'Android',
          'version': androidInfo.version.release,
          'manufacturer': androidInfo.manufacturer,
          'model': androidInfo.model,
          'isPhysicalDevice': androidInfo.isPhysicalDevice,
          'deviceMetaTag': await _getAndroidDeviceId()
        };
      } else if (Platform.isIOS) {
        final IosDeviceInfo iosInfo = await _deviceInfo.iosInfo;
        return {
          'platform': 'iOS',
          'version': iosInfo.systemVersion,
          'model': iosInfo.model,
          'isPhysicalDevice': iosInfo.isPhysicalDevice,
          'deviceMetaTag': await _getIosDeviceId()
        };
      }
      return {'platform': 'Unknown'};
    } catch (e) {
      return {'error': e.toString()};
    }
  }
}
