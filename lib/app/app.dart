import 'package:learn_stacked/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:learn_stacked/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:learn_stacked/ui/views/home/home_view.dart';
import 'package:learn_stacked/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:learn_stacked/ui/views/counter/counter_view.dart';
import 'package:learn_stacked/ui/views/login/login_view.dart';
import 'package:learn_stacked/services/authentication_service.dart';
import 'package:learn_stacked/ui/views/text_reverse/text_reverse_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    // this is if you want custom transition
    // CustomRoute(
    //   page: CounterView,
    //   transitionsBuilder: TransitionsBuilders.zoomIn,
    // ),
    MaterialRoute(page: CounterView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: TextReverseView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
