import 'package:flutter_r1/actions.dart';
import 'package:flutter_r1/store.dart';

AppStore counterReducer(AppStore state, dynamic action) {
  if (action is ActionUpdateUser) {
    state.user = action.user;
  }

  return state;
}
