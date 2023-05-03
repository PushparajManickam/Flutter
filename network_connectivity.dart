import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:mysamil/Widgets/bottomSheetAlert.dart';
import 'package:mysamil/main.dart';

class NetworkConnectivity with ChangeNotifier {
  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      log('Couldn\'t check connectivity status', error: e);
      return;
    }
    return updateConnectionStatus(result);
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus = result;
    if (identical(connectionStatus, ConnectivityResult.none)) {
      //alert
    }
    notifyListeners();
  }
}
//main
//navigatorKey: navigatorKey,
//final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
/*
NetworkConnectivity().initConnectivity();
      connectivitySubscription = connectivity.onConnectivityChanged
          .listen(NetworkConnectivity().updateConnectionStatus);
          */
