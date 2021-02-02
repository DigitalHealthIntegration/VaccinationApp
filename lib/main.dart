import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_r1/app_routing.dart';
import 'package:flutter_r1/constants.dart';
import 'package:flutter_r1/controllers/google_sign_in.dart';
import 'package:flutter_r1/controllers/shared_preference.dart';
import 'package:flutter_r1/model/location_model.dart';
import 'package:flutter_r1/model/user_model.dart';
import 'package:flutter_r1/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'reducers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp();
  await SharedPreferencesUtils.init();

  GoogleSignInService googleSignInService = GoogleSignInService();
  if (await googleSignInService.isSignedIn()) {
    googleSignInService.signOutGoogle();
  }

  String userFromPrefs =
      SharedPreferencesUtils.getString(SharedPreferenceKeys.user);
  String initialRoute = AppRoutes.InitialLogin;
  UserModel user;
  if (userFromPrefs != null) {
    user = userModelFromJson(userFromPrefs);
    initialRoute = AppRoutes.Home;
  }

  List<LocationModel> locations = [
    LocationModel(id: 1, hospitalName: "Parsnip Health1", city: "Boston"),
    LocationModel(id: 2, hospitalName: "Parsnip Health2", city: "Boston"),
    LocationModel(id: 3, hospitalName: "Parsnip Health3", city: "Boston"),
    LocationModel(id: 4, hospitalName: "Parsnip Health4", city: "Boston")
  ];
  final store = Store<AppStore>(counterReducer,
      initialState: new AppStore(
          locations: locations, initialRoute: initialRoute, user: user));

  runApp(FlutterReduxApp(
    title: 'Flutter App',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<AppStore> store;
  final String title;

  FlutterReduxApp({Key key, this.store, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppStore>(store: store, child: AppRouting());
  }
}
