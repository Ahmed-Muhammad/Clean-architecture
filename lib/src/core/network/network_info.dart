import 'package:internet_connection_checker/internet_connection_checker.dart';

//سبب اني اعملته abstract class
//ان ممكن InternetConnectionChecker توقف في المستقبل
//فا عشان اقدر اغير فيها

abstract class NetworkInfo {
  Future<bool> get isDeviceConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  // internet_connection_checker الخاصه بـ
  @override
  Future<bool> get isDeviceConnected {
    return connectionChecker.hasConnection;
  }
}
