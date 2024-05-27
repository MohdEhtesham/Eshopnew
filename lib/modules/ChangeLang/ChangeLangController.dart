import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:get/get.dart';
import 'package:eshop/modules/OnboardingScreen/OnboardingScreen.dart';
import 'package:eshop/utils/SharedPreference.dart';
import 'package:geolocator/geolocator.dart';

import '../../components/strings/Constants.dart';
import '../../network/api_client.dart';

class ChangeLangController extends GetxController {
  Rx<Locale> localevalue = const Locale('en').obs;
  RxBool isLoading = false.obs;
  RxString userLocation = "".obs;
  RxString streetNumber = "".obs;
  RxString route = "".obs;
  RxString locality = "".obs;

  changeLanguageEnglish() async {
    print("English");
    isLoading.value = true;

    localevalue.value = const Locale('en');
    Get.updateLocale(localevalue.value);
    print("========= : $localevalue");
    await TAPrefs.setInt('language', 0);
    Get.to(() => OnboardingScreen());
    isLoading.value = false;
  }

  changeLanguageEnglishFromProfile() async {
    print("English");
    isLoading.value = true;

    localevalue.value = const Locale('en');
    Get.updateLocale(localevalue.value);
    print("========= : $localevalue");
    await TAPrefs.setInt('language', 0);

    isLoading.value = false;
  }

  changeLanguageSpanish() async {
    isLoading.value = true;

    localevalue.value = const Locale('es');
    print("Spanish");
    print("========= : $localevalue");
    await TAPrefs.setInt('language', 1);

    Get.updateLocale(localevalue.value);
    Get.to(() => OnboardingScreen());
    isLoading.value = false;
  }

  changeLanguageSpanishFromProfile() async {
    isLoading.value = true;

    localevalue.value = const Locale('es');
    print("Spanish");
    print("========= : $localevalue");
    await TAPrefs.setInt('language', 1);

    Get.updateLocale(localevalue.value);

    isLoading.value = false;
  }

  Future<void> getUserLocationDetails(Position position) async {
    isLoading.value = true;

    String apiKey = Constants.googlePlacesAPIKEY;
    String host;
    List addressComponents = [];
    double latitude = position.latitude;
    double longitude = position.longitude;
    print("lat long Dash, $latitude, $longitude");
    host = 'https://maps.google.com/maps/api/geocode/json';
    final url = '$host?key=$apiKey&language=en&latlng=$latitude,$longitude';
    var response = await ApiClient().commonGetAPIMethod(url, null);
    addressComponents = response!["results"][0]["address_components"];
    // print("address com $addressComponents");
    for (var element in addressComponents) {
      if (element["types"][0] == "street_number") {
        streetNumber.value = element["long_name"] ?? "ABC";
      }
      if (element["types"][0] == "route") {
        route.value = element["short_name"] ?? "ABC";
      }
      if (element["types"][0] == "locality") {
        locality.value = element["long_name"] ?? "ABC";
      }
    }
    userLocation.value = "$streetNumber, $route, $locality";
    print("userLocation: $userLocation");

    isLoading.value = false;
  }
}
