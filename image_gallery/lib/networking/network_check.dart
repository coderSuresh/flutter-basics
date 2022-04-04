import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

void getConnectionAndRedirect(
    {required bool isConnected,
    required ConnectivityResult result,
    required BuildContext context}) async {
  isConnected = await InternetConnectionChecker().hasConnection;
  result = await Connectivity().checkConnectivity();

  if ((result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) &&
      isConnected) {
  } else {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Alert"),
        content: const Text(
            "No internet connection. Please connect to the internet"),
        actions: [
          TextButton(
            onPressed: () {
              SystemNavigator.pop();
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }
}
