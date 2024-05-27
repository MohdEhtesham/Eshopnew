import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Constants/AppColors.dart';
import 'package:location/location.dart';

String _token = '';

Map<String, double> currentLocation = {};

void setCurrentLocation(double latitude, double longitude) {
  currentLocation = {
    "latitude": latitude,
    "longitude": longitude,
  };
  print("Current location is set to $latitude, $longitude");
}

Map get getCurrentLocation => currentLocation;

void setToken(String receivedToken) {
  print("Token is set to $receivedToken");
  _token = receivedToken;
}

String get getToken => _token;

showCustomSnackBar(String message) {
  return Get.rawSnackbar(
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.zero,
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: AppColors.primaryColor);
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = RegExp(pattern);
  return regExp.hasMatch(value);
}


Future<bool> checkIsLocationServiceEnabled() async {
  Location location = Location();
  bool locationServiceEnabled = await location.serviceEnabled();
 
  print("locationServiceEnabled $locationServiceEnabled");
  if (!locationServiceEnabled) {
    final status = await location.requestService();
    print("status $status");
    return true;
  }
  return false;
}