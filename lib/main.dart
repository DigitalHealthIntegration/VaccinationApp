import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_r1/app_routing.dart';
import 'package:flutter_r1/store.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'reducers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final store = Store<AppStore>(counterReducer, initialState: new AppStore());

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
