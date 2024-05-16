import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo{
  Future<bool> get isConnected;
}
class NetworkInfoImpl implements NetworkInfo{
  final InternetConnectionChecker internetConnectionChecker;

  NetworkInfoImpl(this.internetConnectionChecker);

  @override
  // TODO: implement isConnected
  Future<bool> get isConnected async {
          print("-----------${ await internetConnectionChecker.hasConnection}");
    return internetConnectionChecker.hasConnection;
  }

}