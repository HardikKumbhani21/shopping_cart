import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class InternetCheckController extends GetxController {
  late bool internet;
  bool internetCheckLoder = true;

  late StreamSubscription<ConnectivityResult> subscription;

  @override
  void onInit() {
    checkInternetStatus().then((value) {
      internet = value;
      internetCheckLoder = false;
      internetStatusCheck();
    });
    super.onInit();
  }

  Future<bool> checkInternetStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a mobile network.
      return true;
    } else {
      return false;
      // I am not connected  network.
    }
  }

  void internetStatusCheck() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        // I am connected to a mobile network.
        internet = true;
        update();
      } else {
        internet = false;
        update();
        // I am not connected  network.

      }
    });
  }
}
