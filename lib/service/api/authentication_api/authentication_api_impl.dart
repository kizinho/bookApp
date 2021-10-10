import 'package:bookapp/core/model/onboarding/onboarding_status.dart';
import 'package:bookapp/service/api/api_utils/api_helper.dart';

import '../../../../locator.dart';
import 'authentication_api.dart';

class AuthenticationApiImpl implements AuthenticationApi {
  var server = locator<API>();
  onboarding() async {
    Map<String, dynamic> dataStatus = {'status': true};
    var decoded = dataStatus;
    OnboardingStatus response = OnboardingStatus.fromJson(decoded);
    return response;
  }
}
