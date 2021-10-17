import 'dart:convert';
import 'package:booksfinder/core/model/onboarding/onboarding_status.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardInfoCache {
  //Objects used to set data
  OnboardingStatus _onboardingStatus =  OnboardingStatus();
  bool? get status => this._onboardingStatus.status;
  OnboardInfoCache() {
    try {
      getOnboardDataFromStorage();
    } catch (e) {
      // print(
      //     'Could not find any data in shared Preference Location: \'onboarding\'');
    }
  }

  getOnboardDataFromStorage() async {
    try {
      //Instance of SharedPreferences
      SharedPreferences storage = await SharedPreferences.getInstance();
      var data = storage.getString('onboard_data');

      var buffer = jsonDecode(data!);
      //Set object fields
      OnboardingStatus res = OnboardingStatus.fromJson(buffer);
      this._onboardingStatus = res;

      print('${res.status}\'s data fetched from Storage successfully');
    } catch (e) {
      print('There is no data in location: \'onboarding data\'');
    }
  }

  Future<bool> cacheOnboardResponse(OnboardingStatus response) async {
    try {
      //Instance of SharedPreferences
      SharedPreferences storage = await SharedPreferences.getInstance();
      //Sets value in storage labelled ['onboard_data']
      bool val = await storage.setString('onboard_data', jsonEncode(response));
      //set new values in class field
      this._onboardingStatus = response;

      print('${response.status}\'s data cached successfully');
      return val;
    } catch (e) {
      print(
          'An error occured while trying to cache Onboarding Response of details: ${jsonEncode(response)}');
      return false;
    }
  }
}
