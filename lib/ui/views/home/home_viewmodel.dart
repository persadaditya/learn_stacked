import 'package:learn_stacked/app/app.bottomsheets.dart';
import 'package:learn_stacked/app/app.dialogs.dart';
import 'package:learn_stacked/app/app.locator.dart';
import 'package:learn_stacked/app/app.router.dart';
import 'package:learn_stacked/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String get counterLabel => 'Counter is: $_counter';
  String get buttonLabel => 'Go to counter view';
  String get buttonFormLabel => 'Go To Form view';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void goToCounterView() async {
    final result = await _navigationService.navigateToCounterView(
        startIndex: 5,
        transition:
            TransitionsBuilders.fadeIn //this is transition when navigating
        );
    print('returned result: $result');
  }

  void goToFormView() async {
    final result = await _navigationService.navigateToTextReverseView(); //this is transition when navigating);
    print('returned result: $result');
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
