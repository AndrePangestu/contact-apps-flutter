import 'package:contact_apps_flutter/features/app_main/presentation/bloc/bottom_navigation_event.dart';
import 'package:contact_apps_flutter/features/app_main/presentation/bloc/bottom_navigation_state.dart';
import 'package:bloc/bloc.dart';


class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  int currentIndex = 0;

  @override
  BottomNavigationState get initialState => PageLoading();

  @override
  Stream<BottomNavigationState> mapEventToState(BottomNavigationEvent event) async* {
    if(event is PageTapped){
      currentIndex = event.index;
      yield PageLoading();

      if(currentIndex == 0){
        yield ContactListPageLoaded();
      }
      if(currentIndex == 1){
        yield ContactMapsPageLoaded();
      }
    }
  }
}