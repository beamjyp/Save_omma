import 'package:bloc/bloc.dart';
import 'settingmompage.dart';
import 'hospital.dart';
import 'homepage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  SettingMomClickedEvent,
  HospitalClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationBloc() : super(HomePage());

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.SettingMomClickedEvent:
        yield SettingMom();
        break;
      case NavigationEvents.HospitalClickedEvent:
        yield Hospital();
        break;
    }
  }
}
