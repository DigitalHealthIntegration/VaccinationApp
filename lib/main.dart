import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_r1/app_routing.dart';
import 'package:flutter_r1/controllers/shared_preference.dart';
import 'package:flutter_r1/model/location_model.dart';
import 'package:flutter_r1/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'reducers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPreferencesUtils.init();

  List<LocationModel> locations = [
    LocationModel(id: 1, hospitalName: "Wits RHI", city: "Johannesburg"),
    LocationModel(id: 2, hospitalName: "Right to Care", city: "Johannesburg")
  ];
  final store = Store<AppStore>(counterReducer, initialState: new AppStore(locations: locations));

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
