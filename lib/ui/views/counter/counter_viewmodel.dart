import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class CounterViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  int _counter = 0;
  int get counter => _counter;

  updateCounterFromHome(int data) {
    _counter = data;
    rebuildUi();
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void backToHome() {
    _navigationService.back(result: 'From back: $counter');
  }
}
