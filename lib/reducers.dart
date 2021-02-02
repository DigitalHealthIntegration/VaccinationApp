import 'package:flutter_r1/actions.dart';
import 'package:flutter_r1/store.dart';

AppStore counterReducer(AppStore state, dynamic action) {
  if (action is ActionUpdateUser) {
    state.user = action.user;
  } else if (action is ActionUpdateVaccine) {
    state.vaccine = action.vaccine;
  } else if (action is ActionUpdateCoupon) {
    state.coupon = action.coupon;
  } else if (action is ActionUpdateShareQrString) {
    state.shareQrString = action.shareQrString;
  } else if (action is ActionUpdateScanType) {
    state.scanType = action.scanType;
  }else if(action is ActionUpdatePassKey){
    state.passKey = action.passKey;
  }
  return state;
}
