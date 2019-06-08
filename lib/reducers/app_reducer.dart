import 'package:flutter_starter/models/app_state.dart';
import 'package:flutter_starter/reducers/update_reducer.dart';
import 'package:flutter_starter/reducers/navigation_reducer.dart';

AppState appReducer(state, action) {
  return new AppState(
      isLoading: false,
      currentUser: updateReducer(state.currentUser, action),
      navigationState: navigationReducer(state.navigationState, action));
}
