import 'package:stacked/stacked.dart';
import 'package:learn_stacked/app/app.locator.dart';
import 'package:learn_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/authentication_service.dart';

class StartupViewModel extends BaseViewModel {
  // 1. Get the Authentication and NavigationService
  final _authenticationService = locator<AuthenticationService>();
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    // 2. Check if the user is logged in
    if (_authenticationService.userLoggedIn()) {
      // 3. Navigate to HomeView
      final result = await _navigationService.replaceWithHomeView(startingIndex: 0);
      print('Returned result: $result');
    } else {
      // 4. Or navigate to LoginView
      _navigationService.replaceWith(Routes.loginView);
    }
  }
}
