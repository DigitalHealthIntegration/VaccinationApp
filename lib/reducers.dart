import 'package:flutter_r1/actions.dart';
import 'package:flutter_r1/store.dart';

AppStore counterReducer(AppStore state, dynamic action) {
  if (action is ActionUpdateUser) {
    state.user = action.user;
  }
  else if (action is ActionUpdateVaccine){
    state.vaccine = action.vaccine;
  }
  else if(action is ActionUpdateShareQrString){
    state.shareQrString = action.shareQrString;
  }
  return state;
}
